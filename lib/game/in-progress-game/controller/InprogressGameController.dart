import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:run_wearos/model/game/response/GameHistoryResponse.dart';
import 'package:run_wearos/utils/DiskDatabase.dart';
import 'package:stomp_dart_client/stomp_dart_client.dart';

import '../../../model/game/request/GameHistoryUpdateRequest.dart';
import '../../../model/game/response/GameInProgressWatchResponse.dart';

class InProgressGameController extends GetxController {
  late Rx<GameHistoryResponse> gameHistoryResponse;
  Rx<GameInProgressWatchResponse?> gameWatchResponse = Rx<GameInProgressWatchResponse?>(null);
  late StompClient stompClient;
  late String? userId;
  Timer? sendTimer;

  Rx<Duration> elapsedTime = Duration.zero.obs;
  Rx<Duration> remainingTime = Duration.zero.obs;

  Timer? timeTracker;

  Future<bool> load(GameHistoryResponse gh) async {
    gameHistoryResponse = gh.obs;
    connectToStomp();
    userId = await DiskDatabase().getUserId();
    _startTimer();
    return true;
  }

  void _startTimer() {
    timeTracker = Timer.periodic(Duration(seconds: 1), (_) {
      final start = gameHistoryResponse.value.startAt;
      final end = gameHistoryResponse.value.endAt;
      final now = DateTime.now();

      elapsedTime.value = now.difference(start);
      remainingTime.value = end.difference(now).isNegative ? Duration.zero : end.difference(now);
    });
  }

  void connectToStomp() {
    stompClient = StompClient(
      config: StompConfig(
        url: 'ws://10.0.2.2:8080/game',
        onConnect: onStompConnected,
        onWebSocketError: (dynamic error) => print('WebSocket Error: $error'),
        onStompError: (dynamic error) => print('Stomp Error: $error'),
        onDisconnect: (frame) => print('Disconnected'),
        heartbeatOutgoing: Duration(seconds: 10),
        heartbeatIncoming: Duration(seconds: 10),
      ),
    );
    stompClient.activate();
  }

  void onStompConnected(StompFrame frame) {
    sendTimer = Timer.periodic(Duration(seconds: 30), (_) {
      sendGameUpdate();
    });

    stompClient.subscribe(
      destination: '/sub/game/my/${gameHistoryResponse.value.gameId}/${userId}',
      callback: (frame) {
        final Map<String, dynamic> json = jsonDecode(frame.body!);
        final response = GameInProgressWatchResponse.fromJson(json);
        gameWatchResponse.value = response;
      },
    );
  }

  void sendGameUpdate() {
    final updateRequest = GameHistoryUpdateRequest(
      gameId: gameHistoryResponse.value.gameId,
      userId: int.parse(userId!),
      currentBpm: 120.0,
      currentCadence: 85.0,
      currentDistance: 1.2,
      currentFlightTime: 0.22,
      currentGroundContactTime: 0.15,
      currentPower: 250.0,
      currentVerticalOscillation: 6.5,
      currentSpeed: 3.6,
    );

    final jsonBody = jsonEncode(updateRequest.toJson());

    stompClient.send(
      destination: '/pub/game/update',
      body: jsonBody,
    );
  }

  @override
  void onClose() {
    sendTimer?.cancel();
    timeTracker?.cancel();
    stompClient.deactivate();
    super.onClose();
  }
}

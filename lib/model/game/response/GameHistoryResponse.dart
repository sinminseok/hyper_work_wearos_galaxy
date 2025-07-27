import 'package:run_wearos/model/game/enums/GameDistance.dart';
import 'package:run_wearos/model/game/enums/GameType.dart';

class GameHistoryResponse {
  final DateTime gameDate;
  final int gameId;
  final GameType gameType;
  final GameDistance gameDistance;
  final DateTime endAt;
  final DateTime startAt;
  final int myRank;
  final int participatedCount;
  final double myPrize;
  final bool connectedWatch;

  GameHistoryResponse({
    required this.gameDate,
    required this.gameId,
    required this.gameType,
    required this.gameDistance,
    required this.endAt,
    required this.startAt,
    required this.myRank,
    required this.participatedCount,
    required this.myPrize,
    required this.connectedWatch,
  });

  factory GameHistoryResponse.fromJson(Map<String, dynamic> json) {
    return GameHistoryResponse(
      gameDate: DateTime.parse(json['gameDate']),
      gameId: json['gameId'],
      gameType: GameTypeExtension.fromString(json['gameType']),
      gameDistance: GameDistanceExtension.fromString(json['gameDistance']),
      endAt: DateTime.parse(json['endAt']),
      startAt: DateTime.parse(json['startAt']),
      myRank: json['myRank'],
      participatedCount: json['participatedCount'] ?? 0, // 값이 없으면 0으로 대체
      myPrize: (json['myPrize'] as num).toDouble(),
      connectedWatch: json['connectedWatch']
    );
  }
}



import 'package:get/get.dart';
import 'package:run_wearos/model/game/response/GameHistoryResponse.dart';
import 'package:run_wearos/rest-api/game/GameApi.dart';

class GameListViewController extends GetxController{
  List<GameHistoryResponse> games = [];

  Future<bool> load() async {
    print("1111");
    await GameApi().findMyProfile();
    games.addAll(await GameApi().findAllGames());

    return true;
  }
}
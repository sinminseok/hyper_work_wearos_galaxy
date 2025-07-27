
import 'dart:convert';

import 'package:run_wearos/model/user/response/UserProfileResponse.dart';

import '../../model/game/response/GameHistoryResponse.dart';
import '../../utils/DiskDatabase.dart';
import '../../utils/RestApiUtils.dart';
import '../ApiUrls.dart';

class GameApi {

  final RestApiUtils restApiUtils = RestApiUtils();

  /**
   * 모든 경기 조회
   */

  Future<List<GameHistoryResponse>> findAllGames() async {
    //await DiskDatabase().getAccessToken();
    String? accessToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJBY2Nlc3NUb2tlbiIsImVtYWlsIjoidGVzdDEyM0BuYXZlci5jb20ifQ.9lQnf2BYM2CVtmAgGO2JcfHyWvXvuHot1yFLXc4M2AbD07hDm867XNI0z4c6Si4Pc5WsWM6EEmWUV3yyLCtIMQ";
    String url = ApiUrls.GAMES_HISTORIES;
    var response = await restApiUtils.getResponse(url, accessToken: accessToken);
    List<GameHistoryResponse> responseGames = [];
    if (response.statusCode == 200) {
      final Map<String, dynamic> decoded = jsonDecode(utf8.decode(response.bodyBytes));
      final List<dynamic> dataList = decoded['data'];
      responseGames = dataList.map((e) => GameHistoryResponse.fromJson(e)).toList();
    }
    return responseGames;
  }


  Future<bool> findMyProfile() async {
    //await DiskDatabase().getAccessToken();
    String? accessToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJBY2Nlc3NUb2tlbiIsImVtYWlsIjoidGVzdDEyM0BuYXZlci5jb20ifQ.9lQnf2BYM2CVtmAgGO2JcfHyWvXvuHot1yFLXc4M2AbD07hDm867XNI0z4c6Si4Pc5WsWM6EEmWUV3yyLCtIMQ";
    String url = ApiUrls.USER_PROFILE_URL;
    var response = await restApiUtils.getResponse(url, accessToken: accessToken);
    if (response.statusCode == 200) {
      var userProfileResponse = UserProfileResponse.fromJson(jsonDecode(utf8.decode(response.bodyBytes))['data']);
      DiskDatabase().setUserId(userProfileResponse.id.toString());
    }
    return true;
  }
}
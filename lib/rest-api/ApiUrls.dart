import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiUrls{
  static String ROOT_URL = dotenv.get("ROOT_API_URL");

  static String USER_LOGIN_URL = "$ROOT_URL/users/login";
  static String USER_SIGNUP_URL = "$ROOT_URL/users";
  static String USER_PROFILE_URL = "$ROOT_URL/users/my-profile";

  static String GAMES_HISTORIES = "$ROOT_URL/games/participate/history";
}
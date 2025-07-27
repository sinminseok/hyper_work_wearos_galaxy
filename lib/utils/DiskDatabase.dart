import 'package:shared_preferences/shared_preferences.dart';

class DiskDatabase {

  static const String ACCESS_TOKEN = "access_token";
  static const String REFRESH_TOKEN = "refresh_token";
  static const String USER_ID = "user_id";
  static const String LOGIN_ID = "login_id";
  static const String LOGIN_PASSWORD = "login_password";
  static const String SECRET_KEY = "secret_key";

  Future<String?> getAccessToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(ACCESS_TOKEN);
  }

  Future<String?> getRefreshToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(REFRESH_TOKEN);
  }

  Future<String?> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(USER_ID);
  }

  Future<String?> getLoginId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(LOGIN_ID);
  }

  Future<String?> getLoginPassword() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(LOGIN_PASSWORD);
  }

  Future<String?> getSecretKey() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SECRET_KEY);
  }

  Future<void> setSecretKey(String secretKey) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(SECRET_KEY, secretKey);
  }

  Future<void> setLoginId(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(LOGIN_ID, id);
  }

  Future<void> setLoginPassword(String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(LOGIN_PASSWORD, password);
  }

  Future<void> setUserId(String userId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(USER_ID, userId);
  }

  Future<void> setAccessToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(ACCESS_TOKEN, token);
  }

  Future<void> setRefreshToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(REFRESH_TOKEN, token);
  }


  Future<void> removeAllMemory() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(ACCESS_TOKEN);
    await prefs.remove(REFRESH_TOKEN);
    await prefs.remove(USER_ID);
    await prefs.remove(LOGIN_PASSWORD);
    await prefs.remove(LOGIN_ID);
  }

}
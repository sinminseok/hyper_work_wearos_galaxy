import 'dart:convert';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'DiskDatabase.dart';

class RestApiUtils {


  Map<String, String> getHeaders({String? accessToken}) {
    var headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
    };
    if (accessToken != null) {
      headers['Authorization'] = 'Bearer $accessToken';
    }
    return headers;
  }

  Future<http.Response> getResponse(String url, {String? accessToken}) async {
    return await http.get(
      Uri.parse(url),
      headers: getHeaders(accessToken: accessToken),
    );
  }

  Future<http.Response> patchWithBodyResponse(String url, dynamic? body,
      {String? accessToken}) async {
    return await http.patch(Uri.parse(url),
        headers: getHeaders(accessToken: accessToken), body: json.encode(body));
  }

  Future<http.Response> deleteWithBodyResponse(String url,
      {String? accessToken}) async {
    return await http.delete(
      Uri.parse(url),
      headers: getHeaders(accessToken: accessToken),
    );
  }

  Future<http.Response> patchResponse(String url, {String? accessToken}) async {
    return await http.patch(
      Uri.parse(url),
      headers: getHeaders(accessToken: accessToken),
    );
  }

  Future<http.Response> postResponse(String url, dynamic body,
      {String? accessToken}) async {
    return await http.post(
      Uri.parse(url),
      headers: getHeaders(accessToken: accessToken),
      body: body != null ? json.encode(body) : null,
    );
  }

  bool isValidResponse(http.Response response) {
    return response.statusCode == 200;
  }

  void validateToken(http.Response response) {
    var decodedResponse = json.decode(utf8.decode(response.bodyBytes));
    if (decodedResponse['message'] == "Access token is invalid") {
      throw Exception("Something went wrong!");
    }
  }

  dynamic decodeResponse(http.Response response) {
    return json.decode(utf8.decode(response.bodyBytes))["data"];
  }
}
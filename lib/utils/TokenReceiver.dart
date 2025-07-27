import 'package:flutter/services.dart';

class TokenReceiver {
  static const MethodChannel _channel = MethodChannel('com.hyper_run/token');

  static void init() {
    _channel.setMethodCallHandler((call) async {
      if (call.method == "receiveToken") {
        final token = call.arguments as String;
        print("📥 Wear OS에서 받은 토큰: $token");
      }
    });
  }
}
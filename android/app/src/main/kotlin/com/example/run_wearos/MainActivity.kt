package com.example.run_wearos

import android.util.Log
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

import com.google.android.gms.wearable.MessageClient
import com.google.android.gms.wearable.MessageEvent
import com.google.android.gms.wearable.Wearable


class MainActivity : FlutterActivity(), MessageClient.OnMessageReceivedListener {
    private val CHANNEL = "com.hyper_run/token"
    private var methodChannel: MethodChannel? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        methodChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
        Log.d("WearOS", "✅ MethodChannel configured")
    }

    override fun onResume() {
        super.onResume()
        Wearable.getMessageClient(this).addListener(this)
        Log.d("WearOS", "🟢 MessageClient listener added")
    }

    override fun onPause() {
        super.onPause()
        Wearable.getMessageClient(this).removeListener(this)
        Log.d("WearOS", "🔴 MessageClient listener removed")
    }

    override fun onMessageReceived(messageEvent: MessageEvent) {
        Log.d("WearOS", "📩 Message received: ${messageEvent.path}")
        if (messageEvent.path == "/token") {
            val token = String(messageEvent.data)
            Log.d("WearOS", "📥 Received token: $token")
            sendTokenToFlutter(token)
        } else {
            Log.d("WearOS", "❌ Unknown message path: ${messageEvent.path}")
        }
    }

    private fun sendTokenToFlutter(token: String?) {
        token ?: return
        Log.d("WearOS", "📡 Sending token to Flutter: $token")
        methodChannel?.invokeMethod("receiveToken", token)
    }
}

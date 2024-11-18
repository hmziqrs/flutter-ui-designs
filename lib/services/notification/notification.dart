import 'dart:io';
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

part 'background.dart';
part 'local.dart';
part 'configs.dart';
part 'utils.dart';
part 'models.dart';

class AppFCM {
  static final ins = FirebaseMessaging.instance;

  static Future<void> init() async {
    LocalNotification.init();
    // FirebaseMessaging.onBackgroundMessage(_onBackgroundMessageHandler);
    if (Platform.isIOS) {
      await _requestPermission();
    }
    await AppFCM.ins.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  static Future<String?> getToken() async {
    return AppFCM.ins.getToken();
  }

  static void onReceiveRemoteMessage() async {
    // _terminatedState();
    _foregroundState();
    _backgroundState();
  }

  static void _foregroundState() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      LocalNotification.showNotification(message);
    });
  }

  static void _backgroundState() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      LocalNotification.handleNotificationAction(message.data);
    });
  }

  static void handleTerminated() async {
    // final message = await Future.value("");
    final message = await AppFCM.ins.getInitialMessage();
    if (message == null) return;

    LocalNotification.handleNotificationAction(message.data);
  }

  static Future<NotificationSettings> _requestPermission() async {
    final settings = await AppFCM.ins.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    return settings;
  }

  static Future<void> subscribeTopic(String topicName) async {
    await AppFCM.ins.subscribeToTopic(
      NotificationUtils.flavoredTopic(topicName),
    );
  }

  static Future<void> unsubscribeTopic(String topicName) async {
    await AppFCM.ins.unsubscribeFromTopic(
      NotificationUtils.flavoredTopic(topicName),
    );
  }
}

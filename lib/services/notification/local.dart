part of 'notification.dart';

class LocalNotification {
  static final ins = FlutterLocalNotificationsPlugin();

  static void init() {
    const initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings(
        '@mipmap/ic_launcher',
      ),
      iOS: DarwinInitializationSettings(
        onDidReceiveLocalNotification:
            LocalNotification.onDidReceiveLocalNotification,
      ),
      macOS: DarwinInitializationSettings(
        onDidReceiveLocalNotification:
            LocalNotification.onDidReceiveLocalNotification,
      ),
    );

    LocalNotification.ins.initialize(
      initializationSettings,
      // onSelectNotification: (string) {
      //   return LocalNotification.handleNotificationAction(
      //     string != null && string != '' ? jsonDecode(string) : {},
      //   );
      // },
    );
  }

  static Future handleNotificationAction(Map<String, dynamic> payload) async {
    if (payload.isNotEmpty) {
      final type = payload['type'];
      switch (type) {
        case NotificationData.order:
          // TODO: type order handling
          break;
        case NotificationData.link:
          // TODO: type link handling
          break;
        case NotificationData.message:
          // TODO: type message handling
          break;
        default:
          print('Type not matched');
      }
    } else {
      return null;
    }
  }

  static Future<void> showNotification(RemoteMessage message) async {
    final notification = message.notification;
    if (notification == null) return;
    await LocalNotification.ins.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          MAIN_CHANNEL.id,
          MAIN_CHANNEL.name,
          channelDescription: MAIN_CHANNEL.description,
          priority: Priority.high,
          importance: Importance.max,
          playSound: true,
        ),
        iOS: const DarwinNotificationDetails(
          presentSound: true,
        ),
      ),
      payload: jsonEncode(message.data),
    );
  }

  static Future onDidReceiveLocalNotification(
    int id,
    String? title,
    String? body,
    String? payload,
  ) async {
    //
  }
}

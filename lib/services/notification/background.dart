part of 'notification.dart';

Future<void> _onBackgroundMessageHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

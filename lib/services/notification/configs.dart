part of 'notification.dart';

const MAIN_CHANNEL = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  description:
      "This channel is used for important notifications.", // description
  importance: Importance.high,
);

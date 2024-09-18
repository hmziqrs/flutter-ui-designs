part of 'notification.dart';

class NotificationUtils {
  static String flavoredTopic(String value) {
    // String topicName;
    // final environment = AppFlavor.env;
    // final isRelease = AppFlavor.isRelease();
    // switch (environment) {
    //   case Env.prod:
    //     topicName = '$value-prod';
    //     break;
    //   case Env.dev:
    //     topicName = '$value-dev';
    //     break;
    //   case Env.stage:
    //     topicName = '$value-stage';
    //     break;
    //   case Env.qa:
    //     topicName = '$value-qa';
    //     break;
    // }

    // if (isRelease) {
    //   topicName = "$topicName-release";
    // } else {
    //   topicName = "$topicName-debug";
    // }

    // return topicName;
    return value;
  }
}

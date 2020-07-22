import 'package:flutter_driver/flutter_driver.dart';

abstract class Screenshot {
  static String platform;
  static FlutterDriver driver;

  static Future<void> screenshot(String label) async {
    switch (platform) {
      case "linux":
        await screenshotLinux(label);
        break;
      default:
    }
  }

  static Future<void> screenshotLinux(
    String label,
  ) async {
    try {
      print("screenName $label");
    } catch (e) {}
  }
}

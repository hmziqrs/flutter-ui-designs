import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';

abstract class Screenshot {
  static String platform;
  static FlutterDriver driver;

  static Future<void> screenshot(String label) async {
    switch (platform) {
      case "linux":
        await screenshotLinux(label);
        break;
      case "windows":
        screenshotWindows(label);
        break;
      default:
    }
  }

  static Future<void> screenshotLinux(String label) async {
    try {
      print("screenName $label");
    } catch (e) {}
  }

  static void screenshotWindows(String label) {
    try {
      final libPath = "..\\..\\test_driver\\libs\\screenshot-windows.exe";
      final directory = "screenshots\\windows";

      Process.runSync(
        libPath,
        [label],
        runInShell: true,
        workingDirectory: directory,
      );
      // await Future.delayed(Duration(seconds: 1));
    } catch (e) {
      print("ERROR CAN'T TAKE $label screenshot");
    }
  }
}

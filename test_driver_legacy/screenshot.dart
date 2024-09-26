import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';

abstract class Screenshot {
  static late String platform;
  static late String device;
  static late FlutterDriver driver;

  static Future<void> screenshot(
    String label, {
    int pre = 0,
    int post = 0,
  }) async {
    final int defaultDelay = 1000;
    await Future.delayed(Duration(milliseconds: defaultDelay + pre));
    switch (platform) {
      case "linux":
        await screenshotLinux(label);
        break;
      case "windows":
        screenshotWindows(label);
        break;

      case "android":
        await screenshotAndroid(label);
        break;
      default:
    }
    await Future.delayed(Duration(milliseconds: defaultDelay + post));
  }

  static Future<void> screenshotLinux(String label) async {
    try {
      final libPath = "./../../test_driver/libs/screenshot-linux";
      final directory = "screenshots/linux";

      final obj = Process.runSync("pwd", []);

      print("PWD: ${obj.stdout}");
      print("ERROR");
      print(obj.stderr);

      Process.runSync(
        libPath,
        [label],
        workingDirectory: directory,
      );
    } catch (e) {
      print(e.toString());
      print("ERROR CAN'T TAKE $label screenshot");
    }
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

  static Future<void> screenshotAndroid(String label) async {
    try {
      // adb exec-out screencap -p > screen.png
      final filePath =
          "screenshots/android/${device != null ? "$device/" : ""}$label.png";
      if (Platform.isLinux) {
        final lib = "./test_driver/libs/androidsc.sh";
        final List<String> arguments = [filePath];
        Process.runSync(
          lib,
          arguments,
          runInShell: Platform.isWindows,
        );
        return;
      }
      final arguments = [
        "exec-out",
        "screencap",
        "-p",
        ">",
        normalize(filePath),
      ];
      Process.runSync(
        "adb",
        arguments,
        runInShell: Platform.isWindows,
      );
    } catch (e) {
      print("ERROR CAN'T TAKE $label screenshot");
    }
  }

  static Future<void> screenshotAndroidNotUsed(String label) async {
    try {
      final bytes = await driver.screenshot();
      final file = File(normalize("screenshots/windows/$label.png"));
      await file.writeAsBytes(bytes);
    } catch (e) {
      print("ERROR CAN'T TAKE $label screenshot");
    }
  }

  static String normalize(String path) {
    if (Platform.isWindows) {
      return path.replaceAll("/", "\\");
    }
    return path;
  }
}

import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';

abstract class Utils {
  static String platform;
  static FlutterDriver driver;

  static bool isMobile;
  static bool isDesktop;
  static bool isWeb;

  static Future<void> init(String newPlatform) async {
    platform = newPlatform;
    isMobile = ["android", "ios"].contains(platform);
    isDesktop = ["linux", "windows", "macos"].contains(platform);
    isWeb = !isMobile && !isDesktop;

    await initDirectories();
  }

  static initDirectories() {
    final root = Directory("screenshots");
    if (!root.existsSync()) {
      root.createSync();
    }

    final dirs = ["android", "ios", "linux", "windows", "macos"];
    final devices = ["mobile", "tab7", "tab10"];

    dirs.forEach((name) async {
      final path = "screenshots/$name";
      final dir = Directory(path);
      final check = await dir.exists();

      if (!check) {
        await dir.create();
      }
      if (name == "android") {
        print("UTILS INIT ANDROID");

        devices.forEach((device) async {
          final dPath = "$path/$device";
          final dDir = Directory(dPath);
          final dCheck = await dDir.exists();
          if (!dCheck) {
            await dDir.create();
          }
        });
      }
    });
  }

  static initMaxWindowsCmdow() async {
    final rawCode = Process.runSync(
      ".\\test_driver\\libs\\cmdow.exe",
      ["|", "findstr", "flutter"],
      runInShell: true,
    );

    print(" ***** RAW CODE *****");
    print(rawCode.stdout);

    final List<String> test =
        rawCode.stdout.toString().split("\n")[0].split(" ");
    print(" ***** PARSED CODE ***** ");
    print(test);

    final parsedCode = test[0];

    // return;
    final out = Process.runSync(
      ".\\test_driver\\libs\\cmdow.exe",
      [parsedCode, "/MAX"],
      runInShell: true,
    );

    print(" ***** OUTPUT ***** ");
    print(out);
  }

  static initMaxWindowsMode() async {
    final vm = await driver.serviceClient.getVM();
    final libArgs = [
      "/c",
      "call .\\test_driver\\libs\\windowMode.bat -pid ${vm.pid} -mode maximized"
    ];

    Process.runSync(
      "cmd.exe",
      libArgs,
      runInShell: true,
    );
  }
}

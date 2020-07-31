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

    return;
    if (newPlatform == "windows") {
      Utils.initMaxWindowsMode();
    }
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

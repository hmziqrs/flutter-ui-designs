import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_uis/io/io.dart';

import 'package:flutter_uis/main.dart' as app;

main(List<String> args) {
  final navigationObserver = NavigatorObserver();

  enableFlutterDriverExtension(
    handler: (data) async {
      if (data == "nav_go_back") {
        navigationObserver.navigator.pop();
        return "";
      }
      if (data == "dimensions") {
        final size = MediaQuery.of(navigationObserver.navigator.context).size;
        return "${size.width},${size.height}";
      }
      if (data == "platform") {
        if (Platform.isLinux) {
          return "linux";
        } else if (Platform.isAndroid) {
          return "android";
        } else if (Platform.isIOS) {
          return "ios";
        } else if (Platform.isWindows) {
          return "windows";
        } else if (Platform.isMacOS) {
          return "macos";
        } else {
          return "web";
        }
      }
      return "enableFlutterDriverExtension";
    },
  );

  app.main();
}

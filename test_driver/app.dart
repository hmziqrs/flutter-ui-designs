import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_uis/io/io.dart';
import 'package:flutter_uis/main.dart' as app;

import 'utils.dart';

void main(List<String> args) async {
  final navigationObserver = NavigatorObserver();

  const device = String.fromEnvironment("DEVICE");

  enableFlutterDriverExtension(
    handler: (data) async {
      if (data == "nav_go_back") {
        navigationObserver.navigator?.pop();
        return "";
      }
      if (data == "device") {
        return device;
      }
      if (data == "dimensions") {
        final ctx = navigationObserver.navigator?.context;
        print("CHECK $ctx");
        if (ctx == null) return "100,100";
        final size = MediaQuery.of(ctx).size;
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
  app.mainTest(navigationObserver);

  // When I maximize windows after test driver connects with the app.
  // It wasn't working my actions were failing.
  // Maybe driver save dimensions & offets of window frame and widgets at the initial connection.
  // And maybe changing windows frame size were messing up with the initial data.
  // That's why I had to maximize windows before driver connects with the app instance.
  // So driver saves the proper data from start.
  const platform = String.fromEnvironment("PLATFORM");
  int delay = 2;

  if (platform == "windows") {
    Utils.initMaxWindowsCmdow();
    delay = 8;
  }
  // This is for safety so app is rendered properly before test driver connects with the app instance
  await Future.delayed(Duration(seconds: delay));
}

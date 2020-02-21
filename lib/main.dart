import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;

import 'package:universal_io/io.dart';

import 'package:flutter_uis/Navigator.dart';

void main() {
  if (Platform.isWindows || Platform.isLinux) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }
  FlutterError.onError = (FlutterErrorDetails err) {};
  runApp(AppNavigator([]));
}

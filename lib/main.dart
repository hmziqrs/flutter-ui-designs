import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;

import 'package:flutter_uis/io/io.dart';

import 'FKNNAPP.dart';
import 'Navigator.dart';

void main() {
  if (Platform.isWindows || Platform.isLinux) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }

  runApp(AppNavigator([]));
}

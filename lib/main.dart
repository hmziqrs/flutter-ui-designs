import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;

import 'package:flutter_uis/Navigator.dart';
import 'package:flutter_uis/io/io.dart';

void main(List<String> args) {
  _main(null);
}

void mainTest(NavigatorObserver observer) {
  _main(observer);
}

void _main(NavigatorObserver observer) {
  if (Platform.isWindows || Platform.isLinux) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }
  FlutterError.onError = (FlutterErrorDetails err) {};
  final List<NavigatorObserver> observers = [];

  if (observer != null) {
    observers.add(observer);
  }

  runApp(AppNavigator(observers));
}

import 'package:flutter/material.dart';

import 'package:flutter_uis/Navigator.dart';
import 'package:flutter_uis/configs/App.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main(List<String> args) {
  _main(null);
}

void mainTest(NavigatorObserver observer) {
  _main(observer);
}

void _main(NavigatorObserver observer) async {
  App.showAds = false;
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('app');

  FlutterError.onError = (FlutterErrorDetails err) {};
  final List<NavigatorObserver> observers = [];

  if (observer != null) {
    observers.add(observer);
  }

  runApp(AppNavigator(observers));
}

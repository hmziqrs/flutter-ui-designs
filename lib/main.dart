import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_uis/Navigator.dart';
import 'package:flutter_uis/configs/App.dart';

import 'package:hive_flutter/hive_flutter.dart';

Future<void> main(List<String> args) async {
  await _main(null);
}

Future<void> mainTest(NavigatorObserver observer) async {
  await _main(observer);
}

Future<void> _main(NavigatorObserver? observer) async {
  App.showAds = false;
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('app');

  FlutterError.onError = (FlutterErrorDetails err) {};
  final List<NavigatorObserver> observers = [];

  if (observer != null) {
    observers.add(observer);
  }

  runApp(ProviderScope(child: AppNavigator(observers)));
}

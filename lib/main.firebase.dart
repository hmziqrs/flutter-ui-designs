import 'package:flutter/material.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter_uis/utils/UIUtils.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

import 'utils/Utils.dart';
import 'Navigator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  await Hive.openBox('app');
  UIUtils.setLightStatusBar();
  print("YES SLAVE");

  final List<NavigatorObserver> observers = [];

  if (Utils.isMobile()) {
    observers.add(FirebaseAnalyticsObserver(
      analytics: FirebaseAnalytics(),
    ));
  }

  FlutterError.onError = (FlutterErrorDetails err) {
    FirebaseCrashlytics.instance.recordFlutterError(err);
  };
  runApp(AppNavigator(observers));
}

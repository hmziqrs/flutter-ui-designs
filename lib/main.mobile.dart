import 'package:flutter/material.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

import 'package:flutter_uis/Navigator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('app');

  final analyticsObeserver = FirebaseAnalyticsObserver(
    analytics: FirebaseAnalytics(),
  );
  // Crashlytics.instance.enableInDevMode = true;

  FlutterError.onError = (FlutterErrorDetails err) {
    Crashlytics.instance.recordFlutterError(err);
  };
  runApp(AppNavigator([analyticsObeserver]));
}

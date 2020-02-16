import 'package:flutter/material.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

import 'package:flutter_uis/Navigator.dart';

void main() {
  print("THIS IS FCKING MOBILE APP");
  final analyticsObeserver =
      FirebaseAnalyticsObserver(analytics: FirebaseAnalytics());
  Crashlytics.instance.enableInDevMode = true;

  // Pass all uncaught errors to Crashlytics.
  FlutterError.onError = (FlutterErrorDetails err) {
    Crashlytics.instance.recordFlutterError(err);
  };
  runApp(AppNavigator([analyticsObeserver]));
}

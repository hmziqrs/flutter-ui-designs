import 'package:flutter/material.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:universal_io/io.dart';

import 'utils/UIUtils.dart';
import 'utils/Utils.dart';
import 'configs/App.dart';
import 'Navigator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  App.showAds = Utils.isMobile();
  if (App.showAds) {
    Admob.initialize();
    if (Platform.isIOS) {
      await Admob.requestTrackingAuthorization();
    }
  }
  await Firebase.initializeApp();
  await Hive.initFlutter();
  await Hive.openBox('app');
  UIUtils.setLightStatusBar();

  final List<NavigatorObserver> observers = [];

  if (Utils.isMobile() || (!Utils.isMobile() && !Utils.isDesktop())) {
    observers.add(FirebaseAnalyticsObserver(
      analytics: FirebaseAnalytics(),
    ));
  }

  FlutterError.onError = (FlutterErrorDetails err) {
    FirebaseCrashlytics.instance.recordFlutterError(err);
  };
  runApp(AppNavigator(observers));
}

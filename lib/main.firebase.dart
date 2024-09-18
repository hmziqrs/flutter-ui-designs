
import 'package:flutter/material.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_uis/firebase_options.dart';
import 'package:flutter_uis/services/notification/notification.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:flutter_uis/io/io.dart';
import 'utils/UIUtils.dart';
import 'utils/Utils.dart';
import 'configs/App.dart';
import 'Navigator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  AppFCM.init();

  App.showAds = Utils.isMobile();
  if (App.showAds) {
    await MobileAds.instance.initialize();
    if (Platform.isIOS) {
      // await MobileAds.instance.req;
      // await Admob.requestTrackingAuthorization();
    }
  }
  await Firebase.initializeApp();
  await Hive.initFlutter();
  await Hive.openBox('app');
  UIUtils.setLightStatusBar();

  final List<NavigatorObserver> observers = [];

  if (Utils.isMobile() || (!Utils.isMobile() && !Utils.isDesktop())) {
    observers.add(FirebaseAnalyticsObserver(
      analytics: FirebaseAnalytics.instance,
    ));
  }

  FlutterError.onError = (FlutterErrorDetails err) {
    FirebaseCrashlytics.instance.recordFlutterError(err);
  };
  runApp(ProviderScope(child: AppNavigator(observers)));
}

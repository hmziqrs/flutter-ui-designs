import 'package:flutter/material.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_uis/firebase_options.dart';
import 'package:flutter_uis/services/notification/notification.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'utils/UIUtils.dart';
import 'configs/App.dart';
import 'Navigator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  App.showAds = false;
  AppFCM.init();

  await Hive.initFlutter();
  await Hive.openBox('app');
  UIUtils.setLightStatusBar();

  final List<NavigatorObserver> observers = [
    FirebaseAnalyticsObserver(
      analytics: FirebaseAnalytics.instance,
    )
  ];

  runApp(ProviderScope(child: AppNavigator(observers)));
}

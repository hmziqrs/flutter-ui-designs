import 'package:flutter/material.dart';
import 'package:flutter_uis/Navigator.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

// import 'package:flutter/scheduler.dart' show timeDilation;

void main() {
  // timeDilation = 2;
  Crashlytics.instance.enableInDevMode = true;

  // Pass all uncaught errors to Crashlytics.
  FlutterError.onError = (FlutterErrorDetails details) {
    Crashlytics.instance.onError(details);
  };
  runApp(AppNavigator());
}

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;

import 'package:universal_io/io.dart';

import 'package:flutter_uis/Navigator.dart';

// import 'package:firebase_crashlytics/firebase_crashlytics.dart';

// import 'package:flutter/scheduler.dart' show timeDilation;

void main() {
  if (Platform.isWindows || Platform.isLinux) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }
  // timeDilation = 2;
  // Crashlytics.instance.enableInDevMode = true;

  // Pass all uncaught errors to Crashlytics.
  FlutterError.onError = (FlutterErrorDetails err) {
    // print(err);
    // Crashlytics.instance.recordFlutterError(err);
  };
  runApp(AppNavigator());
}

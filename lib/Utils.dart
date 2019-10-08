import 'package:flutter/services.dart';

class Utils {
  static lightStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarIconBrightness: Brightness.light,
    ));
  }

  static darkStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarIconBrightness: Brightness.dark,
    ));
  }

  static rangeMap(
      double number, double inMin, double inMax, double outMin, double outMax) {
    return (number - inMin) * (outMax - outMin) / (inMax - inMin) + outMin;
  }

  static safeOpacity(double opacity) {
    if (opacity < 0) {
      return 0.0;
    } else if (opacity > 1) {
      return 1.0;
    }
    return opacity;
  }
}

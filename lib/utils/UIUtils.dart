import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_uis/configs/App.dart';
import 'package:flutter_uis/configs/AppTheme.dart';
import 'package:flutter_uis/io/io.dart';

class UIUtils {
  static SystemUiOverlayStyle getThemeStatusBar(
    BuildContext context, [
    Brightness forceBrightness,
  ]) {
    final isDark = App.isDark(context);
    final brightness =
        forceBrightness ?? (isDark ? Brightness.light : Brightness.dark);
    final base = brightness == Brightness.dark
        ? SystemUiOverlayStyle.light
        : SystemUiOverlayStyle.dark;

    if (Platform.isIOS) {
      final brightness = (!isDark ? Brightness.light : Brightness.dark);
      return base.copyWith(
        statusBarBrightness: brightness,
        statusBarIconBrightness: brightness,
        systemNavigationBarIconBrightness: brightness,
      );
    } else {
      return (base.copyWith(
        statusBarBrightness: brightness,
        statusBarIconBrightness: brightness,
        systemNavigationBarIconBrightness: brightness,
        systemNavigationBarColor: AppTheme.background,
        systemNavigationBarDividerColor: AppTheme.background2,
      ));
    }
  }

  static setLightStatusBar() {
    return SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
  }

  static setDarkStatusBar() {
    return SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }
}

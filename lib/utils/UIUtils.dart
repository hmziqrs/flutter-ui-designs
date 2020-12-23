import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_uis/configs/App.dart';
import 'package:flutter_uis/configs/AppTheme.dart';
import 'package:flutter_uis/io/io.dart';

class UIUtils {
  static SystemUiOverlayStyle getThemeStatusBar(
    BuildContext context, {
    Brightness statusBarBrightness,
    Brightness navBarBrightness,
  }) {
    final isDark = App.isDark(context);
    final brightness = isDark ? Brightness.light : Brightness.dark;
    final base = brightness == Brightness.dark
        ? SystemUiOverlayStyle.light
        : SystemUiOverlayStyle.dark;

    if (Platform.isIOS) {
      final brightness = (!isDark ? Brightness.light : Brightness.dark);
      return base.copyWith(
        statusBarBrightness: statusBarBrightness ?? brightness,
        statusBarIconBrightness: statusBarBrightness ?? brightness,
        systemNavigationBarIconBrightness: statusBarBrightness ?? brightness,
      );
    } else {
      final reverse = statusBarBrightness == Brightness.light
          ? Brightness.dark
          : Brightness.light;

      Color systemNavigationBarColor = AppTheme.background;
      Color systemNavigationBarDividerColor = AppTheme.background2;
      if (navBarBrightness == Brightness.light) {
        systemNavigationBarColor = AppTheme.dark;
        systemNavigationBarDividerColor = AppTheme.background2Dark;
      }
      return (base.copyWith(
        statusBarBrightness: statusBarBrightness != null ? reverse : brightness,
        statusBarIconBrightness:
            statusBarBrightness != null ? reverse : brightness,
        systemNavigationBarIconBrightness: navBarBrightness ?? brightness,
        systemNavigationBarColor: systemNavigationBarColor,
        systemNavigationBarDividerColor: systemNavigationBarDividerColor,
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

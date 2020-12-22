import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_uis/configs/App.dart';
import 'package:flutter_uis/configs/AppTheme.dart';
import 'package:flutter_uis/io/io.dart';

class UIUtils {
  static themeStatusBar(BuildContext context) {
    final isDark = App.isDark(context);
    final brightness = isDark ? Brightness.light : Brightness.dark;
    final base =
        isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark;

    if (Platform.isIOS) {
      SystemChrome.setSystemUIOverlayStyle(
        base,
      );
    } else {
      SystemChrome.setSystemUIOverlayStyle(
        base.copyWith(
          statusBarBrightness: brightness,
          statusBarIconBrightness: brightness,
          systemNavigationBarIconBrightness: brightness,
          systemNavigationBarColor: AppTheme.background,
          systemNavigationBarDividerColor: AppTheme.background2,
        ),
      );
    }
  }

  static lightStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
    ));
  }

  static darkStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarIconBrightness: Brightness.dark,
      // systemNavigationBarIconBrightness: Brightness.dark,
    ));
  }
}

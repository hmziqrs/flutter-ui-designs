import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_uis/configs/App.dart';

class UIUtils {
  static themeStatusBar(BuildContext context) {
    final isDark = App.isDark(context);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
        systemNavigationBarIconBrightness:
            isDark ? Brightness.light : Brightness.dark,
      ),
    );
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

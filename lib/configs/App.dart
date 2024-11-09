import 'package:flutter/material.dart';
import 'package:flutter_uis/AppLocalizations.dart';

import 'AppDimensions.dart';
import 'TextStyles.dart';
import 'CommonProps.dart';
import 'AppTheme.dart';

class App {
  static late BuildContext ctx;
  static late bool isLtr;
  static late bool showAds = false;

  static init(BuildContext context) {
    AppDimensions.init(context);
    AppTheme.init(context);
    TextStyles.init();
    CommonProps.init();
    App.ctx = context;
    isLtr = Directionality.of(context) == TextDirection.ltr;
  }

  static translate(String? key, [BuildContext? ctx]) {
    final base = AppLocalizations.of(ctx ?? App.ctx);
    if (base == null) {
      return key;
    }
    return base.translate(key ?? '') ?? key;
  }

  static bool isDark([BuildContext? context]) =>
      Theme.of(context ?? App.ctx).brightness == Brightness.dark;
}

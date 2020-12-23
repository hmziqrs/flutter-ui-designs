import 'package:flutter/material.dart';
import 'package:flutter_uis/AppRoutes.dart';
import 'package:flutter_uis/utils/UIUtils.dart';

const MODE = 'mode';
const LIGHT = 'light';
const DARK = 'dark';

final statusBarMap = {
  AppRoutes.home: MODE,
  AppRoutes.about: MODE,
  AppRoutes.aboutDeveloper: MODE,
  AppRoutes.download: MODE,
  AppRoutes.uiList: MODE,
  AppRoutes.uiDetail: MODE,
  AppRoutes.designerProfile: MODE,

  // Healthy Food Delivery
  AppRoutes.hfdHome: MODE,
  AppRoutes.hfdDetail: MODE,

  // Hot Air Balloon
  AppRoutes.habHome: MODE,
  AppRoutes.habDetail: MODE,

  // Sky View
  AppRoutes.skvHome: MODE,
  AppRoutes.skvDetail: MODE,

  AppRoutes.ascHome: MODE,

  AppRoutes.etcHome: MODE,
};

class StatusBarHandler {
  static get(BuildContext context, String route) {
    final theme = statusBarMap[route];
    switch (theme) {
      case DARK:
        return UIUtils.getThemeStatusBar(context, Brightness.dark);
        break;
      case LIGHT:
        return UIUtils.getThemeStatusBar(context, Brightness.light);
        break;
      default:
        return UIUtils.getThemeStatusBar(context);
    }
  }
}

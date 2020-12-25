import 'package:flutter/material.dart';
import 'package:flutter_uis/AppRoutes.dart';
import 'package:flutter_uis/utils/UIUtils.dart';

const MODE = 'mode';
const LIGHT = 'light';
const LIGHT_NAVDARK = 'light_navDark';
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
  AppRoutes.habHome: LIGHT,
  AppRoutes.habDetail: MODE,

  // Sky View
  AppRoutes.skvHome: DARK,
  AppRoutes.skvDetail: LIGHT_NAVDARK,

  AppRoutes.ascHome: LIGHT,

  AppRoutes.etcHome: MODE,
};

class StatusBarHandler {
  static get(BuildContext context, String route) {
    final theme = statusBarMap[route];
    switch (theme) {
      case DARK:
        return UIUtils.getThemeStatusBar(
          context,
          statusBarBrightness: Brightness.light,
          navBarBrightness: Brightness.light,
        );
        break;
      case LIGHT:
        return UIUtils.getThemeStatusBar(
          context,
          statusBarBrightness: Brightness.dark,
          navBarBrightness: Brightness.dark,
        );
        break;
      case LIGHT_NAVDARK:
        return UIUtils.getThemeStatusBar(
          context,
          statusBarBrightness: Brightness.dark,
          navBarBrightness: Brightness.light,
        );
        break;
      default:
        return UIUtils.getThemeStatusBar(context);
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:url_launcher/url_launcher.dart' as url;
// import 'package:device_info/device_info.dart';

class Utils {
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

  static launchUrl(link) async {
    final bool safeCheck = await url.canLaunch(link);
    if (safeCheck) {
      await url.launch(link);
    }
  }

  static soicalLink(username, platform) {
    String base = 'https://';
    final coms = ['facebook', 'instagram', 'dribbble', 'fiverr'];
    final nets = ['behance'];

    if (coms.contains(platform)) {
      return "${base + platform}.com/$username";
    } else if (nets.contains(platform)) {
      return "${base + platform}.net/$username";
    } else if (platform == 'skype') {
      return "skype:$username?chat";
    } else if (platform == 'email') {
      return "mailto:$username";
    } else if (platform == 'phone') {
      return "tel:$username";
    }
  }

  static EdgeInsetsGeometry safePaddingUnit(
    BuildContext context,
    String direction,
  ) {
    final padding = MediaQuery.of(context).viewPadding;
    if (direction == 'top') {
      return EdgeInsets.only(top: padding.top);
    } else if (direction == 'bottom') {
      return EdgeInsets.only(bottom: padding.bottom);
    } else if (direction == 'right') {
      return EdgeInsets.only(right: padding.right);
    } else if (direction == 'left') {
      return EdgeInsets.only(left: padding.left);
    } else if (direction == 'horizontal') {
      return EdgeInsets.only(right: padding.right, left: padding.left);
    } else if (direction == 'vertical') {
      return EdgeInsets.only(top: padding.top, bottom: padding.bottom);
    } else if (direction == 'all') {
      return EdgeInsets.only(
        top: padding.top,
        bottom: padding.bottom,
        right: padding.right,
        left: padding.left,
      );
    } else {
      return EdgeInsets.all(0.0);
    }
  }

  static Widget safePadding(
    BuildContext context,
    String direction, [
    bool sliver = false,
  ]) {
    final paddingWidget = safePaddingUnit(context, direction);
    if (sliver) {
      return SliverPadding(padding: paddingWidget);
    }
    return Padding(padding: paddingWidget);
  }
}

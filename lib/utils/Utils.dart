import 'package:flutter_uis/io/io.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart' as url;
import 'package:open_url/open_url.dart';

class Utils {
  static double rangeMap(
    double number,
    double inMin,
    double inMax,
    double outMin,
    double outMax, {
    bool safe = false,
  }) {
    final range =
        (number - inMin) * (outMax - outMin) / (inMax - inMin) + outMin;
    if (safe) {
      return range.clamp(outMin, outMax);
    }
    return range;
  }

  static double rangeL2LMap(
    double number,
    double inMin,
    double inMid,
    double inMax,
    double outMin,
    double outMid,
    double outMax, {
    bool safe = false,
  }) {
    double parsed = Utils.rangeMap(number, inMin, inMid, outMin, outMid);

    if (parsed > outMid) {
      parsed = Utils.rangeMap(number, inMid, inMax, outMid, outMax);
    }

    if (safe) {
      if (parsed <= outMin) return outMin;
      if (parsed >= outMax) return outMax;
    }

    return parsed;
  }

  static launchUrl(link) async {
    try {
      if (Platform.isWindows || Platform.isLinux) {
        final result = await openUrl(link);
        return result.exitCode != 0;
      } else {
        final bool safeCheck = await url.canLaunch(link);
        if (safeCheck) {
          await url.launch(link);
        }
        return safeCheck;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  static socialLink(username, platform) {
    String base = 'https://';
    final coms = ['facebook', 'instagram', 'dribbble', 'twitter', 'fiverr'];
    final nets = ['behance'];

    if (username == null) {
      return null;
    }

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
    } else if (platform == 'whatsapp') {
      return "https://api.whatsapp.com/send?phone=$username";
    } else if (platform == 'linkedin') {
      return "$base/linkedin.com/in/$username";
    }
  }

  static launchSocialLink(username, platform) {
    Utils.launchUrl(Utils.socialLink(username, platform));
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

  static bool isWeb() => kIsWeb;

  static bool isAndroid() => !isWeb() && Platform.isAndroid;
  static bool isIOS() => !isWeb() && Platform.isIOS;
  static bool isWindows() => !isWeb() && Platform.isWindows;
  static bool isMacOS() => !isWeb() && Platform.isMacOS;
  static bool isLinux() => !isWeb() && Platform.isLinux;
  

  static bool isDesktop() {
    return isMacOS() || isWindows() || isLinux();
  }

  static bool isMobile() {
    return isAndroid() || isIOS();
  }

}

import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart' as url;
// import 'package:device_info/device_info.dart';
import 'package:get_version/get_version.dart';

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

  static printDebug(String string, {bool deviceInfo = true}) async {
    final version = await GetVersion.platformVersion;

    print("\n\n/** STARt **/");
    if (deviceInfo != null) {
      print("version $version");
    }
    print(string);
    print("/** END **/\n\n");
  }

  static launchUrl(link) async {
    final bool safeCheck = await url.canLaunch(link);
    if (safeCheck) {
      await url.launch(link);
    }
  }

  static soicalLink(username, platform) {
    String base = 'https://';
    final coms = ['facebook', 'instagram', 'dribble', 'fiverr'];
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
}

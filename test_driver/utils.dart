import 'package:flutter_driver/flutter_driver.dart';

abstract class Utils {
  static String platform;

  static bool isMobile;
  static bool isDesktop;
  static bool isWeb;

  static init(String newPlatform) {
    platform = newPlatform;
    isMobile = ["android", "ios"].contains(platform);
    isDesktop = ["linux", "windows", "macos"].contains(platform);
    isWeb = !isMobile && !isDesktop;
  }
}

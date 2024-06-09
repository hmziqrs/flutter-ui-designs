import 'package:flutter_uis/io/io.dart';
import 'dart:math';

import 'package:flutter/foundation.dart';

abstract class Ads {
  static bool _forceTest = true;
  static bool _test = kDebugMode || _forceTest;

  static String getAppId() {
    return "ca-app-pub-9217632370383904~2821189635";
  }

  static String _testBanner() {
    if (Platform.isIOS) return "ca-app-pub-3940256099942544/2934735716";
    return "ca-app-pub-3940256099942544/6300978111";
  }

  static String _testInterstitial() {
    if (Platform.isIOS) {
      const image = "ca-app-pub-3940256099942544/4411468910";
      const video = "ca-app-pub-3940256099942544/5135589807";
      final roll = Random().nextInt(2);
      return roll == 1 ? image : video;
    }
    return "ca-app-pub-3940256099942544/6300978111";
  }

  static String bannerHome() {
    if (_test) return _testBanner();
    return "ca-app-pub-9217632370383904/2314759267";
  }

  static String bannerDownload() {
    if (_test) return _testBanner();
    return "ca-app-pub-9217632370383904/9583307904";
  }

  static String bannerExploreUIs() {
    if (_test) return _testBanner();
    return "ca-app-pub-9217632370383904/3396006216";
  }

  static String interstitialUIDetail() {
    if (_test) return _testInterstitial();
    return "ca-app-pub-9217632370383904/3620102073";
  }
}

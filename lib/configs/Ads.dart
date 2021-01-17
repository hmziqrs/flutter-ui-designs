import 'package:universal_io/io.dart';

abstract class Ads {
  static bool _test = false;

  static String getAppId() {
    return "ca-app-pub-9217632370383904~2821189635";
  }

  static String _testBanner() {
    if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/2934735716";
    }
    return "ca-app-pub-3940256099942544/6300978111";
  }

  static String _testInterstitial() {
    if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/5135589807";
    }
    return "ca-app-pub-3940256099942544/6300978111";
  }

  static String getHomeScreenBanner() {
    if (_test) {
      return _testBanner();
    }
    return "ca-app-pub-9217632370383904/2314759267";
  }

  static String getDownloadScreenBanner() {
    if (_test) {
      return _testBanner();
    }

    return "ca-app-pub-9217632370383904/7647795233";
  }

  static String getExploreUIsScreenBanner() {
    if (_test) {
      return _testBanner();
    }

    return "ca-app-pub-9217632370383904/4417521880";
  }

  static String getOpenAppVideo() {
    if (_test) {
      return _testInterstitial();
    }

    return "ca-app-pub-9217632370383904/3620102073";
  }
}

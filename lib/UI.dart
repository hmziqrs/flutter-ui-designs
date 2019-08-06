import 'package:flutter/widgets.dart';

class UI {
  static MediaQueryData _mediaQueryData;
  static double width;
  static double height;
  static double horizontal;
  static double vertical;

  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double safeBlockHorizontal;
  static double safeBlockVertical;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    width = _mediaQueryData.size.width;
    height = _mediaQueryData.size.height;
    horizontal = width / 100;
    vertical = height / 100;

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (width - _safeAreaHorizontal) / 100;
    safeBlockVertical = (height - _safeAreaVertical) / 100;
  }
}

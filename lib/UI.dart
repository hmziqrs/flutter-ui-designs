import 'dart:math';
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

  static bool isTablet;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    initTablet(_mediaQueryData);

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

  static bool initTablet(MediaQueryData query) {
    var size = query.size;
    var diagonal =
        sqrt((size.width * size.width) + (size.height * size.height));

    /*
    print(
      'size: ${size.width}x${size.height}\n'
      'pixelRatio: ${query.devicePixelRatio}\n'
      'pixels: ${size.width * query.devicePixelRatio}x${size.height * query.devicePixelRatio}\n'
      'diagonal: $diagonal'
    );
    */

    isTablet = diagonal > 1100.0;
    return isTablet;
  }

  static MediaQueryData mediaQuery() => _mediaQueryData;
}

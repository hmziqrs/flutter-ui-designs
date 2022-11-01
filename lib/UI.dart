import 'dart:math';
import 'package:flutter/widgets.dart';

import 'DeviceType.dart';

class UI {
  static late MediaQueryData _mediaQueryData;
  static late double width;
  static late double height;
  static late double horizontal;
  static late double vertical;

  static late double _safeAreaHorizontal;
  static late double _safeAreaVertical;
  static late double safeWidth;
  static late double safeHeight;

  static late bool isTablet;
  static late double diagonal;

  static late bool xxs;
  static late bool xs;
  static late bool sm;
  static late bool md;
  static late bool xmd;
  static late bool lg;
  static late bool xl;
  static late bool xlg;
  static late bool xxlg;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    initChecks(_mediaQueryData);

    width = _mediaQueryData.size.width;
    height = _mediaQueryData.size.height;
    horizontal = width / 100;
    vertical = height / 100;

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeWidth = (width - _safeAreaHorizontal);
    safeHeight = (height - _safeAreaVertical);
  }

  static initChecks(MediaQueryData query) {
    var size = query.size;
    diagonal = sqrt((size.width * size.width) + (size.height * size.height));
    // print('size: ${size.width}x${size.height}\n'
    //     'pixelRatio: ${query.devicePixelRatio}\n'
    //     'pixels: ${size.width * query.devicePixelRatio}x${size.height * query.devicePixelRatio}\n'
    //     'diagonal: $diagonal\n'
    //     'Device.get().isTablet ${Device.get().isTablet}\n'
    //     'Device.get().isIphoneX ${Device.get().isIphoneX}');
    isTablet = diagonal > 900.0 && Device.get().isTablet;
    xxs = size.width > 300;
    xs = size.width > 360;
    sm = size.width > 480;
    md = size.width > 600;
    xmd = size.width > 720;
    lg = size.width > 980;
    xl = size.width > 1160;
    xlg = size.width > 1400;
    xxlg = size.width > 1700;
  }

  static MediaQueryData mediaQuery() => _mediaQueryData;

  static Size getSize() => _mediaQueryData.size;
}

import 'package:flutter/material.dart';
import 'package:tinycolor/tinycolor.dart';

import 'Theme.dart' as theme;

class AppTheme {
  static late BuildContext ctx;

  static double buttonRadius = 6.0;
  static double cartRadius = 12.0;

  static late Color cardBg;
  static late Color background;
  static late Color background2;
  static late Color background2Dark;
  static late Color background2Light;
  static late Color backgroundSub;

  static late Color shadow;
  static late Color shadow2;
  static late Color lightShadow;
  static late Color lightShadow2;

  static late Color text;
  static late Color text01;
  static late Color text02;
  static late Color text03;
  static late Color subText;
  static late Color subText2;
  static late Color subText3;

  // Consts
  static final Color dark = TinyColor.fromString('#333').color;
  static final Color light = TinyColor.fromString('#fdfdfd').color;

  static final Color primary = theme.primary;
  static final Color primary1 = theme.primary1;
  static final Color primary2 = theme.primary2;

  static final Color accent = theme.accent;
  static final Color accent1 = theme.accent1;
  static final Color accent2 = theme.accent2;

  // Social
  static final Color facebook = TinyColor.fromString('#3f528c').color;

  // Init
  static init(BuildContext context) {
    AppTheme.ctx = context;

    background = Colors.white;
    background2 = light.toTinyColor().darken(5).color;
    backgroundSub = TinyColor.fromString("#f9f9f9").color;

    shadow = Colors.black.withOpacity(0.25);
    shadow2 = Colors.black.withOpacity(0.15);
    lightShadow = Colors.black.withOpacity(0.09);
    lightShadow2 = Colors.black.withOpacity(0.05);

    cardBg = TinyColor.fromString("#f3f3f3").color;

    text = Colors.black;
    text01 = Colors.black.withOpacity(0.1);
    text02 = Colors.black.withOpacity(0.2);
    text03 = Colors.black.withOpacity(0.3);
    subText = Colors.black.withOpacity(0.70);
    subText2 = Colors.black.withOpacity(0.60);
    subText3 = Colors.black.withOpacity(0.40);

    background2Dark = TinyColor(theme.darkBackground).lighten(7).color;
    background2Light = light.toTinyColor().darken(5).color;

    if (isDark()) {
      background = theme.darkBackground;
      background2 = TinyColor(theme.darkBackground).lighten(7).color;
      backgroundSub = TinyColor.fromString("#2b2b2b").color;

      shadow = Colors.black.withOpacity(0.50);
      shadow2 = Colors.black.withOpacity(0.40);
      lightShadow = Colors.black.withOpacity(0.30);
      lightShadow2 = Colors.black.withOpacity(0.25);

      text = Colors.white;
      text01 = Colors.white.withOpacity(0.1);
      text02 = Colors.white.withOpacity(0.2);
      text03 = Colors.white.withOpacity(0.3);
      subText = Colors.white.withOpacity(0.70);
      subText2 = Colors.white.withOpacity(0.60);
      subText3 = Colors.white.withOpacity(0.40);
    }
  }

  static bool isDark([BuildContext? ctx]) =>
      Theme.of(ctx ?? AppTheme.ctx).brightness == Brightness.dark;
}

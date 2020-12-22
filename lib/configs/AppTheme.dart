import 'package:flutter/material.dart';
import 'package:tinycolor/tinycolor.dart';

import 'Theme.dart' as theme;

class AppTheme {
  static BuildContext ctx;

  static double buttonRadius = 4.0;

  static Color cardBg;
  static Color background;
  static Color background2;
  static Color backgroundSub;

  static Color shadow;
  static Color shadow2;
  static Color lightShadow;
  static Color lightShadow2;

  static Color text;
  static Color text01;
  static Color text02;
  static Color text03;
  static Color subText;
  static Color subText2;
  static Color subText3;

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

  static bool isDark([BuildContext ctx]) =>
      Theme.of(ctx ?? AppTheme.ctx).brightness == Brightness.dark;
}

import 'package:flutter/material.dart';
import 'package:tinycolor/tinycolor.dart';

import 'theme.dart' as theme;

class AppTheme {
  static BuildContext ctx;

  static Color cardBg;
  static Color background;
  static Color background2;

  static Color shadow;
  static Color shadow2;
  static Color lightShadow;
  static Color lightShadow2;

  static Color text;
  static Color subText;
  static Color subText2;
  static Color subText3;

  // Const
  static final Color dark = TinyColor.fromString('#333').color;
  static final Color light = TinyColor.fromString('#fdfdfd').color;

  static final Color primary = theme.primary;
  static final Color primary1 = theme.primary1;
  static final Color primary2 = theme.primary2;

  static final Color accent = theme.accent;
  static final Color accent1 = theme.accent1;
  static final Color accent2 = theme.accent2;
  // Init
  static init(BuildContext context) {
    AppTheme.ctx = context;

    background = Colors.white;
    background2 = light.toTinyColor().darken(5).color;

    shadow = Colors.black.withOpacity(0.25);
    shadow2 = Colors.black.withOpacity(0.15);
    lightShadow = Colors.black.withOpacity(0.09);
    lightShadow2 = Colors.black.withOpacity(0.05);

    cardBg = TinyColor.fromString("#f3f3f3").color;

    text = Colors.black;
    subText = Colors.black.withOpacity(0.70);
    subText2 = Colors.black.withOpacity(0.60);
    subText3 = Colors.black.withOpacity(0.40);

    if (isDark(context)) {
      background = theme.darkBackground;
      background2 = TinyColor(theme.darkBackground).lighten(7).color;

      shadow = Colors.black.withOpacity(0.50);
      shadow2 = Colors.black.withOpacity(0.40);
      lightShadow = Colors.black.withOpacity(0.30);
      lightShadow2 = Colors.black.withOpacity(0.25);

      text = Colors.white;
      subText = Colors.white.withOpacity(0.70);
      subText2 = Colors.white.withOpacity(0.60);
      subText3 = Colors.white.withOpacity(0.40);
    }
  }

  static bool isDark([BuildContext ctx]) =>
      Theme.of(ctx ?? AppTheme.ctx).brightness == Brightness.dark;
}

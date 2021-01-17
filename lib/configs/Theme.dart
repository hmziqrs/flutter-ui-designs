import 'package:flutter/material.dart';
import 'package:pigment/pigment.dart';
import 'package:tinycolor/tinycolor.dart';

final background = Pigment.fromString('#f5eee6');
final background2 = Pigment.fromString('#f6eee6');

final darkBackground = Pigment.fromString('#1c1c1e');

final subText = Pigment.fromString('#1c1d24').withOpacity(0.6);
final indicator = Pigment.fromString('#1c1d24').withOpacity(0.4);

final primary = TinyColor.fromString("#cc2f2c").color;
final primary1 = TinyColor.fromString("#cc2f2c").lighten(12).color;
final primary2 = TinyColor.fromString("#cc2f2c").darken(18).color;

final accent = TinyColor.fromString("#2FA4FF").color;
final accent1 = TinyColor.fromString("#2FA4FF").lighten(16).color;
final accent2 = TinyColor.fromString("#2FA4FF").darken(18).color;

final base = ThemeData(
  fontFamily: 'Muli',
  accentColor: primary,
  primaryColor: primary,
  brightness: Brightness.light,
  backgroundColor: Colors.white,
  splashColor: Colors.transparent,
  scaffoldBackgroundColor: Colors.white,
  pageTransitionsTheme: PageTransitionsTheme(
    builders: {
      TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
);

final baseDark = ThemeData(
  fontFamily: 'Muli',
  accentColor: primary,
  primaryColor: primary,
  brightness: Brightness.dark,
  backgroundColor: darkBackground,
  splashColor: Colors.transparent,
  scaffoldBackgroundColor: darkBackground,
  pageTransitionsTheme: PageTransitionsTheme(
    builders: {
      TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
);

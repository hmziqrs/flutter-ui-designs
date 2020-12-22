import 'package:flutter/material.dart';

import 'AppDimensions.dart';
import 'AppTheme.dart';

abstract class CommonProps {
  //
  static EdgeInsets btnPadMed;
  static EdgeInsets btnPadSm;

  //
  static LinearGradient gradient1;
  static LinearGradient bottomBgGradient;
  static List<BoxShadow> headerShadow;
  static LinearGradient gradient1Cross;

  static BorderRadius buttonRadius;

  static init() {
    initButtons();
    initGradients();
    initShadows();
    initRadius();
  }

  static initRadius() {
    buttonRadius = BorderRadius.circular(AppTheme.buttonRadius);
  }

  static initButtons() {
    btnPadSm = EdgeInsets.symmetric(
      horizontal: AppDimensions.padding * 2,
      vertical: AppDimensions.padding * 1.0,
    );
    btnPadMed = EdgeInsets.symmetric(
      horizontal: AppDimensions.padding * 3,
      vertical: AppDimensions.padding * 1.5,
    );
  }

  static initGradients() {
    final colors1 = [AppTheme.primary1, AppTheme.primary2];
    gradient1 = LinearGradient(colors: colors1);
    gradient1Cross = LinearGradient(
      colors: colors1,
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
    bottomBgGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        AppTheme.background.withOpacity(0.001),
        AppTheme.background,
      ],
    );
  }

  static initShadows() {
    headerShadow = [
      BoxShadow(
        blurRadius: 10,
        spreadRadius: 4,
        color: AppTheme.lightShadow2,
      ),
    ];
  }
}

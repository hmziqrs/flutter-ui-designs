import 'package:flutter/material.dart';

import 'AppDimensions.dart';
import 'AppTheme.dart';

abstract class CommonProps {
  //
  static late EdgeInsets btnPadMed;
  static late EdgeInsets btnPadSm;

  //
  static late LinearGradient gradient1;
  static late LinearGradient bottomBgGradient;
  static late List<BoxShadow> headerShadow;
  static late LinearGradient gradient1Cross;

  static late BorderRadius buttonRadius;
  static late BorderRadius cardRadius;
  static late BoxDecoration borderButton;

  static init() {
    initRadius();
    initButtons();
    initShadows();
    initGradients();
  }

  static initRadius() {
    buttonRadius = BorderRadius.circular(AppTheme.buttonRadius);
    cardRadius = BorderRadius.circular(AppTheme.cartRadius);
  }

  static initButtons() {
    borderButton = BoxDecoration(
      borderRadius: CommonProps.buttonRadius,
      border: Border.all(
        width: 1.4,
        color: AppTheme.primary,
      ),
    );
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

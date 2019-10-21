import 'package:flutter/material.dart';
import 'package:flutter_uis/UI.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';

class Dimensions {
  static double cardHeight;
  static double cardWidth;

  static init(BuildContext context, Orientation orientation) {
    AppDimensions.init(context, orientation);
    initPotrait();

    if (AppDimensions.isLandscape) {
      initLandscape();
    }

    if (UI.isTablet) {
      initTabletPotrait();
    }
    if (UI.isTablet && AppDimensions.isLandscape) {
      initTabletLandscape();
    }
  }

  static initPotrait() {
    cardHeight = AppDimensions.ratio * 100;
  }

  static initLandscape() {
    cardHeight = AppDimensions.ratio * 120;
  }

  static initTabletPotrait() {
    cardWidth = (UI.width / 2) - AppDimensions.padding;
  }

  static initTabletLandscape() {
    if (UI.diagonal > 1000) {
      cardWidth = (UI.width / 3) - AppDimensions.padding;
    }
  }
}

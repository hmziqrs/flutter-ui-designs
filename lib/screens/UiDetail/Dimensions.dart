import 'package:flutter/material.dart';

import 'package:flutter_uis/UI.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';

class Dimensions {
  static double coverImageHeight;

  static double cardHeight;
  static double cardWidth;

  static init(BuildContext context, Orientation orientation) {
    AppDimensions.init(context, orientation);

    final bool isLandscape = Orientation.landscape == orientation;

    initPotrait();

    if (isLandscape) {
      initLandscape();
    }
    if (UI.isTablet) {
      initTabletPotrait();
    }
    if (UI.isTablet && isLandscape) {
      initTabletLandscape();
    }
  }

  static initPotrait() {
    coverImageHeight = AppDimensions.ratio * 100;

    cardWidth = AppDimensions.ratio * 140;
    cardHeight = AppDimensions.ratio * 85;
  }

  static initLandscape() {
    coverImageHeight = AppDimensions.ratio * 120;

    cardWidth = AppDimensions.ratio * 140;
    cardHeight = AppDimensions.ratio * 85;
  }

  static initTabletPotrait() {
    coverImageHeight = AppDimensions.ratio * 200;

    cardWidth = AppDimensions.ratio * 160;
    cardHeight = AppDimensions.ratio * 90;
  }

  static initTabletLandscape() {
    coverImageHeight = AppDimensions.ratio * 220;

    cardWidth = AppDimensions.ratio * 180;
    cardHeight = AppDimensions.ratio * 100;
  }
}

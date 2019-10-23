import 'package:flutter/material.dart';

import 'package:flutter_uis/UI.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';

class Dimensions {
  static double redBackground;
  static double avatarSize;

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
    redBackground = AppDimensions.ratio * 60;
    avatarSize = AppDimensions.ratio * 60;
  }

  static initLandscape() {
    redBackground = AppDimensions.ratio * 65;
    avatarSize = AppDimensions.ratio * 80;
  }

  static initTabletPotrait() {
    redBackground = AppDimensions.ratio * 200;
    avatarSize = AppDimensions.ratio * 30;
  }

  static initTabletLandscape() {
    redBackground = AppDimensions.ratio * 220;
    avatarSize = AppDimensions.ratio * 30;
  }
}

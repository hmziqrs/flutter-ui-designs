import 'package:flutter/material.dart';

import 'package:flutter_uis/widgets/ScreenReveals/AvatarWithPunchHole.dart';
import 'package:flutter_uis/widgets/Screen/Screen.dart';

import 'widgets/AboutDeveloperBody.dart';

import 'Dimensions.dart';

class AboutDeveloperScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);

    return Screen(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: AboutDeveloperBody(),
          ),
          Positioned.fill(
            child: ScreenRevealAvatarWithPunchHole(
              avatar: "assets/users/hamza.jpg",
              avatarRadius: Dimensions.avatarRadius,
            ),
          ),
        ],
      ),
    );
  }
}

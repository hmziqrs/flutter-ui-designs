import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/Theme.dart' as theme;

import '../Dimensions.dart';

class AboutDeveloperAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final borderWidth = AppDimensions.ratio * 8;
    return Positioned(
      left: 0,
      right: 0,
      top: (Dimensions.redBackground -
          (Dimensions.avatarSize / 2) -
          borderWidth / 2),
      child: Container(
        child: Stack(
          children: <Widget>[
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Dimensions.avatarSize),
                child: Container(
                  width: Dimensions.avatarSize + borderWidth,
                  height: Dimensions.avatarSize + borderWidth,
                  child: Column(
                    children: <Widget>[
                      Flexible(child: Container(color: theme.darkBackground)),
                      Flexible(child: Container(color: theme.primary)),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: borderWidth / 2,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: Dimensions.avatarSize,
                  child: CircleAvatar(
                    backgroundColor: theme.primary,
                    radius: Dimensions.avatarSize / 2,
                    backgroundImage: AssetImage("assets/user/hamza.jpg"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

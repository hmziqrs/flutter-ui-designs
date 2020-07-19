import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/Theme.dart' as theme;
import 'package:flutter_uis/UI.dart';

import '../Dimensions.dart';

class DesignerProfileAvatar extends StatelessWidget {
  DesignerProfileAvatar({@required this.username});

  final String username;

  @override
  Widget build(BuildContext context) {
    double offset = AppDimensions.padding * 2;

    if (UI.width.floor() - AppDimensions.padding * 2 >
        AppDimensions.maxContainerWidth) {
      offset = (UI.width - AppDimensions.maxContainerWidth) / 2;
    }

    final isLtr = Directionality.of(context) == TextDirection.ltr;

    return Positioned(
      top: Dimensions.coverImageHeight - (Dimensions.avatarSize / 2),
      left: isLtr ? offset : null,
      right: !isLtr ? offset : null,
      child: Container(
        width: Dimensions.avatarSize,
        height: Dimensions.avatarSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black,
          border: Border.all(
            width: AppDimensions.padding,
            // color: Colors.white,
            color: theme.primary,
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 12,
              spreadRadius: 8,
              color: Colors.white,
              // color: theme.primary,
            )
          ],
        ),
        child: Center(
          child: Text(
            username,
            style: TextStyle(
              fontSize: Dimensions.avatarSize * 0.15,
              // color: theme.primary,
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_uis/configs/AppTheme.dart';
import 'package:simple_animations/simple_animations.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';

import 'package:flutter_uis/widgets/Screen/Screen.dart';

import 'widgets/DownloadBody.dart';
import 'Dimensions.dart';

class DownloadScreen extends StatelessWidget {
  Widget belowBuilder(context) {
    return CustomAnimation<Color>(
      tween: ColorTween(
        begin: AppTheme.primary.withOpacity(0.15),
        end: AppTheme.primary.withOpacity(1.0),
      ),
      duration: Duration(milliseconds: 2400),
      control: CustomAnimationControl.MIRROR,
      builder: (context, child, animation) {
        return Positioned(
          bottom: AppDimensions.ratio * -10,
          right: AppDimensions.ratio * 5,
          child: Icon(
            MaterialCommunityIcons.cloud_download_outline,
            size: AppDimensions.ratio * 100,
            color: animation,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);

    return Screen(
      belowBuilder: this.belowBuilder,
      child: Align(
        child: Container(
          width: AppDimensions.maxContainerWidth,
          child: DownloadBody(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/AppTheme.dart';
import 'package:flutter_uis/configs/App.dart';

import '../Dimensions.dart';
import '../TestKeys.dart';

enum AniColors { bg, text }

class ASCHomeScreenContentSizes extends StatelessWidget {
  ASCHomeScreenContentSizes({
    @required this.sizes,
    @required this.setSize,
    @required this.uiParallax,
    @required this.activeSize,
    @required this.activePage,
    @required this.activeColor,
  });

  final int activeSize;
  final int activePage;
  final List<int> sizes;
  final double uiParallax;
  final Color activeColor;
  final Function(int size) setSize;

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<AniColors>()
      ..add(
        AniColors.bg,
        Colors.transparent.tweenTo(AppTheme.text03),
        400.milliseconds,
      )
      ..add(
        AniColors.text,
        AppTheme.text.tweenTo(AppTheme.background),
        250.milliseconds,
      );

    return Row(
      children: this
          .sizes
          .asMap()
          .entries
          .map(
            (entry) => Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.padding * 2,
              ),
              child: GestureDetector(
                onTap: () => this.setSize(entry.value),
                key: Key(
                  ASCHomeScreenTestKeys.getSize(
                    activePage,
                    entry.key + 1,
                  ),
                ),
                child: CustomAnimation<MultiTweenValues<AniColors>>(
                  tween: tween,
                  duration: tween.duration,
                  key: Key(App.isDark().toString()),
                  control: this.activeSize == entry.value
                      ? CustomAnimationControl.PLAY
                      : CustomAnimationControl.PLAY_REVERSE,
                  builder: (context, child, animation) {
                    return Container(
                      width: Dimensions.sizeRadius,
                      height: Dimensions.sizeRadius,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: animation.get(AniColors.bg),
                      ),
                      child: Text(
                        entry.value.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: animation.get(AniColors.text),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

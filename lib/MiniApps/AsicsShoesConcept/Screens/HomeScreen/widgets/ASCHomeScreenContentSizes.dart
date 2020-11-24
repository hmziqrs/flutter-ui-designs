import 'package:flutter/material.dart';
import 'package:flutter_uis/MiniApps/AsicsShoesConcept/Screens/HomeScreen/Provider.dart';
import 'package:provider/provider.dart';
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
    @required this.uiParallax,
    @required this.activePage,
    @required this.activeColor,
  });

  final int activePage;
  final double uiParallax;
  final Color activeColor;

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

    return Selector<ASCShoeProvider, int>(
      selector: (_, s) => s.activeShoeSize,
      builder: (context, activeShoeSize, child) {
        return Row(
          children: ASCShoeProvider.shoeSizes.asMap().entries.map(
            (entry) {
              final isActive = activeShoeSize == entry.value;
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.padding * 2,
                ),
                child: GestureDetector(
                  onTap: () => ASCShoeProvider.state(
                    context,
                  ).setShoeSize(entry.value, entry.key),
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
                    control: isActive
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
              );
            },
          ).toList(),
        );
      },
    );
  }
}

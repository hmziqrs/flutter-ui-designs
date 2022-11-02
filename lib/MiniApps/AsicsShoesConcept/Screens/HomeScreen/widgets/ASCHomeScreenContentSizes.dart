import 'package:flutter/material.dart';
import 'package:flutter_uis/MiniApps/AsicsShoesConcept/Screens/HomeScreen/Provider.dart';
import 'package:flutter_uis/Mixins/HoverWidget.dart';
import 'package:provider/provider.dart';
import 'package:supercharged/supercharged.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/AppTheme.dart';
import 'package:flutter_uis/configs/App.dart';

import '../Dimensions.dart';
import '../TestKeys.dart';

enum AniColors { bg, text }

class ASCHomeScreenContentSizes extends StatelessWidget {
  ASCHomeScreenContentSizes({
    required this.uiParallax,
    required this.activePage,
    required this.activeColor,
  });

  final int activePage;
  final double uiParallax;
  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    final tween = MovieTween()
      ..tween(
        AniColors.bg,
        Colors.transparent.tweenTo(AppTheme.text03),
        duration: 400.milliseconds,
      )
      ..tween(
        AniColors.text,
        AppTheme.text.tweenTo(AppTheme.background),
        duration: 250.milliseconds,
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
                  child: CustomAnimationBuilder<Movie>(
                    tween: tween,
                    duration: tween.duration,
                    key: Key(App.isDark().toString()),
                    control: isActive
                        ? Control.play : Control.playReverse,
                    builder: (
                      context,
                      animation,
                      child,
                    ) {
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

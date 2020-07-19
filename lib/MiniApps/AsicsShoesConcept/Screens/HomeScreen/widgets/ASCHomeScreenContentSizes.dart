import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';

import '../Dimensions.dart';

class ASCHomeScreenContentSizes extends StatelessWidget {
  ASCHomeScreenContentSizes({
    @required this.uiParallax,
    @required this.activeColor,
    @required this.activeSize,
    @required this.setSize,
    @required this.sizes,
  });

  final double uiParallax;
  final Color activeColor;
  final int activeSize;
  final List<int> sizes;
  final Function(int size) setSize;

  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("background").add(
        Duration(milliseconds: 180),
        ColorTween(
          begin: Colors.transparent,
          end: Colors.black.withOpacity(0.35),
        ),
      ),
      Track("text").add(
        Duration(milliseconds: 180),
        ColorTween(
          begin: Colors.black,
          end: Colors.white,
        ),
      ),
    ]);

    return Row(
      children: this
          .sizes
          .map(
            (size) => Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.padding * 2,
              ),
              child: GestureDetector(
                onTap: () => this.setSize(size),
                child: ControlledAnimation(
                  tween: tween,
                  duration: tween.duration,
                  playback: this.activeSize == size
                      ? Playback.PLAY_FORWARD
                      : Playback.PLAY_REVERSE,
                  builder: (context, animation) {
                    return Container(
                      width: Dimensions.sizeRadius,
                      height: Dimensions.sizeRadius,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: animation["background"],
                      ),
                      child: Text(
                        size.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: animation["text"],
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

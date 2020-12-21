import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

import 'package:flutter_uis/configs/AppTheme.dart';
import 'package:flutter_uis/UI.dart';

import 'AvatarWithPunchHoleClipper.dart';

class ScreenRevealAvatarWithPunchHole extends StatefulWidget {
  ScreenRevealAvatarWithPunchHole({
    @required this.avatar,
    @required this.avatarRadius,
  });

  final String avatar;
  final double avatarRadius;

  @override
  _ScreenRevealAvatarWithPunchHoleState createState() =>
      _ScreenRevealAvatarWithPunchHoleState();
}

class _ScreenRevealAvatarWithPunchHoleState
    extends State<ScreenRevealAvatarWithPunchHole> {
  bool hide = false;

  @override
  void initState() {
    this.initAsync();
    super.initState();
  }

  Future<void> initAsync() async {
    await 1400.milliseconds.delay;

    if (!this.mounted) {
      return;
    }
    this.setState(() {
      this.hide = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final sliceHeight = UI.height / 2;

    return CustomAnimation<double>(
      tween: 0.0.tweenTo(1.0),
      duration: 900.milliseconds,
      control:
          this.hide ? CustomAnimationControl.PLAY : CustomAnimationControl.STOP,
      builder: (context, _, animation) {
        return Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: animation * -sliceHeight,
              child: ClipPath(
                clipper: AvatarWithPunchHoleClipper(
                  holeRadius: this.widget.avatarRadius,
                  position: "bottom",
                ),
                child: Container(
                  height: sliceHeight,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppTheme.primary,
                        Colors.purple,
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: animation * -sliceHeight,
              child: ClipPath(
                clipper: AvatarWithPunchHoleClipper(
                  holeRadius: this.widget.avatarRadius,
                  position: "top",
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.purple,
                        AppTheme.primary,
                      ],
                    ),
                  ),
                  height: sliceHeight,
                ),
              ),
            ),
            Center(
              child: CustomAnimation<double>(
                tween: 0.0.tweenTo(1.0),
                duration: 700.milliseconds,
                curve: Curves.slowMiddle,
                control: this.hide
                    ? CustomAnimationControl.STOP
                    : CustomAnimationControl.MIRROR,
                child: Container(
                  width: this.widget.avatarRadius,
                  height: this.widget.avatarRadius,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                    border: Border.all(width: 13, style: BorderStyle.solid),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.yellow,
                        blurRadius: 10,
                        spreadRadius: -23.0,
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Image.asset(this.widget.avatar),
                  ),
                ),
                builder: (context, child, value) {
                  double scale = 1 + value * .2;
                  if (hide) {
                    scale = (1 - (animation * 1.5)).clamp(0.0, 3.0);
                  }
                  return Transform(
                    transform: Matrix4.identity()..scale(scale, scale),
                    origin: Offset(
                      this.widget.avatarRadius / 2,
                      this.widget.avatarRadius / 2,
                    ),
                    child: Opacity(
                      opacity: (1 - (animation * 1.5)).clamp(0.0, 1.0),
                      child: Stack(
                        children: [
                          child,
                          Positioned(
                            top: 6,
                            left: 6,
                            child: Transform.rotate(
                              angle: value * 0.45,
                              child: DottedBorder(
                                strokeWidth: 5,
                                color: Colors.white,
                                dashPattern: [4, 12],
                                strokeCap: StrokeCap.round,
                                borderType: BorderType.Circle,
                                child: Container(
                                  width: this.widget.avatarRadius - 16,
                                  height: this.widget.avatarRadius - 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        );
      },
    );
  }
}

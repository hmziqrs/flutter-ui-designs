import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';
import 'package:provider/provider.dart';

import 'package:flutter_uis/Providers/FadeScreen.dart';

class ScreenAnimationBase<T extends FadeScreenProvider>
    extends StatelessWidget {
  const ScreenAnimationBase({
    Key key,
    this.delay,
    this.duration,
    @required this.child,
    @required this.builder,
  }) : super(key: key);

  final int delay;
  final Widget child;
  final int duration;
  final Widget Function(BuildContext, Widget, double) builder;
  @override
  Widget build(BuildContext context) {
    int delay = this.delay ?? 120;
    int duration = this.duration ?? 300;

    return Selector<T, bool>(
      selector: (_, state) => state.fadeOff,
      builder: (context, flag, child) {
        return CustomAnimation<double>(
          child: this.child,
          tween: 0.0.tweenTo(1.0),
          delay: delay.milliseconds,
          duration: duration.milliseconds,
          control: !flag
              ? CustomAnimationControl.PLAY
              : CustomAnimationControl.PLAY_REVERSE,
          builder: this.builder,
        );
      },
    );
  }
}

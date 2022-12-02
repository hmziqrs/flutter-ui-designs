import 'package:flutter/material.dart';
import 'package:flutter_uis/Mixins/HoverWidget.dart';
import 'package:supercharged/supercharged.dart';
import 'package:provider/provider.dart';

import 'package:flutter_uis/Providers/FadeScreen.dart';

class ScreenAnimationBase<T extends FadeScreenProvider>
    extends StatelessWidget {
  const ScreenAnimationBase({
    Key? key,
    this.delay,
    this.duration,
    required this.child,
    required this.builder,
  }) : super(key: key);

  final int? delay;
  final int? duration;
  
  final Widget child;
  final Widget Function(BuildContext, double, Widget?) builder;
  @override
  Widget build(BuildContext context) {
    int delay = this.delay ?? 120;
    int duration = this.duration ?? 300;

    return Selector<T, bool>(
      selector: (_, state) => state.fadeOff,
      builder: (context, flag, child) {
        return CustomAnimationBuilder<double>(
          child: this.child,
          tween: 0.0.tweenTo(1.0),
          delay: delay.milliseconds,
          duration: duration.milliseconds,
          control: !flag
              ? Control.play : Control.playReverse,
          builder: this.builder,
        );
      },
    );
  }
}

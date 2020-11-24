import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class SKVDetailScreenAnimatedText extends StatelessWidget {
  SKVDetailScreenAnimatedText({
    @required this.index,
    @required this.child,
    @required this.pageRendered,
  });

  final int index;
  final bool pageRendered;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    int initialDelay = (this.pageRendered ? 400 : 900) + (this.index * 60);

    return PlayAnimation(
      delay: Duration(milliseconds: initialDelay),
      duration: Duration(milliseconds: 550),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (ctx, _, animation) => Opacity(
        opacity: animation,
        child: child,
      ),
    );
  }
}

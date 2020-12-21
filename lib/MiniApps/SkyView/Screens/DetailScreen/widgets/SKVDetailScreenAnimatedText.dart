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

    return CustomAnimation(
      child: this.child,
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 550),
      delay: Duration(milliseconds: initialDelay),
      builder: (ctx, child, animation) => Opacity(
        opacity: animation,
        child: child,
      ),
    );
  }
}

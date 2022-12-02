import 'package:flutter/material.dart';
import 'package:flutter_uis/Mixins/HoverWidget.dart';
import 'package:provider/provider.dart';
import '../Provider.dart';

class SKVDetailScreenAnimatedText extends StatelessWidget {
  SKVDetailScreenAnimatedText({
    required this.index,
    required this.child,
  });

  final int index;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Selector<SKVDetailState, bool>(
      selector: (_, s) => s.pageRendered,
      builder: (context, pageRendered, _) {
        int initialDelay = (pageRendered ? 400 : 900) + (this.index * 60);
        return PlayAnimationBuilder(
          delay: Duration(milliseconds: initialDelay),
          duration: Duration(milliseconds: 550),
          tween: Tween(begin: 0.0, end: 1.0),
          builder: (ctx, animation, _) => Opacity(
            opacity: animation,
            child: child,
          ),
        );
      },
    );
  }
}

import 'package:flutter/cupertino.dart';

class FadeRouteTransition extends CupertinoPageRoute {
  // final void Function(Widget child) child;
  final Widget child;

  FadeRouteTransition(this.child) : super(builder: (BuildContext ctx) => child);

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}

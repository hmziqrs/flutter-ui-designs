import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
export 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

@optionalTypeArgs
mixin HoverWidgetBase<T extends StatefulWidget> on State<T>
    implements TickerProvider {
  late Ticker _ticker;
  late Animation<double> animation;

  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      duration: 800.milliseconds,
      vsync: this,
    );
    controller.addListener(() => setState(() {}));
    animation = 0.0.tweenTo(1.0).animate(controller);

    super.initState();
  }

  void play(bool start) {
    this.controller.animateTo(
          start ? 1.0 : 0.0,
          duration: Duration(
            milliseconds: 180,
          ),
        );
  }

  Widget buildInkWell({
    Key? key,
    bool isButton = false,
    required Widget child,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      onHover: this.play,
      onTapDown: (_) => this.play(true),
      onTapUp: (_) => this.play(false),
      onTapCancel: () => this.play(false),
      hoverColor: isButton ? null : Colors.transparent,
      focusColor: isButton ? null : Colors.transparent,
      highlightColor: isButton ? null : Colors.transparent,
      splashColor: isButton ? null : Colors.transparent,
      child: child,
    );
  }
}

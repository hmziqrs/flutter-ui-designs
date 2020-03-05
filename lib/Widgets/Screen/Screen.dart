import 'package:flutter/material.dart';
import 'package:flutter_uis/Utils.dart';
import 'package:flutter_uis/configs/AppDimensions.dart';

import 'package:flutter_uis/configs/Theme.dart' as theme;
import 'package:simple_animations/simple_animations/animation_controller_x/animation_controller_mixin.dart';
import 'package:simple_animations/simple_animations/animation_task/from_to_task.dart';
import 'package:simple_animations/simple_animations/animation_task/sleep_task.dart';
export 'package:flutter_uis/configs/Theme.dart';

class Screen extends StatefulWidget {
  final void Function(BuildContext) init;
  final Widget Function(VoidCallback showPopUp) builder;
  final Widget Function(BuildContext context) belowBuilder;
  final Color scaffoldBackgroundColor;
  final ThemeData theme;
  final TextStyle textStyle;
  final BottomNavigationBar bottomNavigationBar;

  Screen(
    this.init, {
    Key key,
    this.theme,
    this.builder,
    this.textStyle,
    this.belowBuilder,
    this.bottomNavigationBar,
    this.scaffoldBackgroundColor,
  }) : super(key: key);

  @override
  ScreenState createState() => ScreenState();
}

class ScreenState extends State<Screen> with AnimationControllerMixin {
  final int popUpTransitionDuration = 240;

  Animation<double> popUpAnimation;
  bool inProgress = false;
  bool mounted = false;
  String popUpTitle;
  String popUpMessage;

  @override
  void initState() {
    popUpAnimation = Tween(begin: 0.0, end: 1.0).animate(controller);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  showPopUp({
    title = "Error",
    message = "Platfrom cannot perform the action",
    duration = 3000,
  }) {
    if (inProgress) {
      return;
    }
    setState(() {
      mounted = true;
      popUpMessage = message;
      popUpTitle = title;
    });
    controller.addTasks([
      FromToTask(
          duration: Duration(milliseconds: popUpTransitionDuration),
          to: 1.0,
          onStart: () {
            inProgress = true;
          }),
      SleepTask(duration: Duration(milliseconds: duration)),
      FromToTask(
          duration: Duration(milliseconds: popUpTransitionDuration),
          to: 0.0,
          onComplete: () {
            inProgress = false;
            setState(() {
              mounted = false;
            });
          }),
    ]);
  }

  buildPopUp() {
    final margin = AppDimensions.padding * 3;
    final borderRadius = BorderRadius.circular(6.0);

    if (!mounted) {
      return Container();
    }

    return Positioned(
      bottom: Utils.rangeMap(
        popUpAnimation.value,
        0.0,
        1.0,
        -30,
        0.0,
      ),
      right: 0,
      child: Opacity(
        opacity: popUpAnimation.value.clamp(0.0, 1.0),
        child: GestureDetector(
          onTap: () => controller.reset([
            FromToTask(
              to: 0.0,
              duration: Duration(milliseconds: popUpTransitionDuration),
              onComplete: () {
                inProgress = false;
                mounted = false;
              },
            )
          ]),
          child: Container(
            margin: EdgeInsets.all(margin),
            width: MediaQuery.of(context).size.width - (margin * 2),
            constraints: BoxConstraints(
              maxWidth: 320,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: borderRadius,
              boxShadow: [
                BoxShadow(
                  blurRadius: 6.0,
                  offset: Offset(0.0, 3.0),
                  color: Colors.black.withOpacity(0.3),
                )
              ],
            ),
            child: ClipRRect(
              borderRadius: borderRadius,
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(width: 6, color: Colors.red),
                  ),
                ),
                padding: EdgeInsets.all(AppDimensions.padding * 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      popUpTitle ?? "",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14 + AppDimensions.ratio * 7,
                      ),
                    ),
                    Container(
                      height: AppDimensions.padding * .5,
                    ),
                    Text(popUpMessage ?? ""),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData rootTheme = widget.theme ??
        Theme.of(context).copyWith(
          primaryColor: theme.primary,
          accentColor: theme.primary,
        );

    final textStyle = widget.textStyle ?? Theme.of(context).textTheme.bodyText1;

    return OrientationBuilder(
      builder: (orientationContext, _) {
        widget.init(orientationContext);

        return Scaffold(
          bottomNavigationBar: this.widget.bottomNavigationBar,
          backgroundColor: this.widget.scaffoldBackgroundColor,
          body: DefaultTextStyle(
            style: textStyle,
            child: Theme(
              data: rootTheme.copyWith(
                textTheme: rootTheme.textTheme.copyWith(
                  bodyText1: textStyle,
                ),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  widget.belowBuilder != null
                      ? widget.belowBuilder(orientationContext)
                      : Container(),
                  Positioned.fill(
                    child: widget.builder(
                      this.showPopUp,
                    ),
                  ),
                  this.buildPopUp(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

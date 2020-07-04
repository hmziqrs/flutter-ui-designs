import 'package:flutter/material.dart';
import 'package:flutter_uis/Widgets/Screen/messages/keys.dart';
import 'package:flutter_uis/configs/App.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:provider/provider.dart';

import 'package:flutter_uis/configs/Theme.dart' as theme;

import 'ScreenStateProvider.dart';

import 'widgets/ScreenSettingsModal.dart';
import 'widgets/ScreenPopUpBody.dart';

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
    title,
    message,
    duration = 3000,
  }) {
    if (inProgress) {
      return;
    }
    setState(() {
      mounted = true;
      popUpMessage = message ?? App.translate(ScreenWidgetMessages.error);
      popUpTitle = title ?? App.translate(ScreenWidgetMessages.cantPerform);
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

  onReset() {
    this.controller.reset([
      FromToTask(
        to: 0.0,
        duration: Duration(milliseconds: popUpTransitionDuration),
        onComplete: () {
          inProgress = false;
          mounted = false;
        },
      )
    ]);
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
                  button: textStyle,
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
                  ScreenPopUpBody(
                    controller: this.controller,
                    mounted: this.mounted,
                    onReset: this.onReset,
                    popUpAnimation: this.popUpAnimation,
                    popUpTitle: this.popUpTitle,
                    popUpMessage: this.popUpMessage,
                  ),
                  ChangeNotifierProvider<ScreenStateProvider>(
                    create: (_) => ScreenStateProvider(),
                    child: ScreenSettingsModal(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

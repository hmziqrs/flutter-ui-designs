import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/ScreenSettingsModal.dart';

import 'ScreenStateProvider.dart';

class Screen extends StatelessWidget {
  Screen({
    this.init,
    this.child,
    this.theme,
    this.drawer,
    this.builder,
    this.textStyle,
    this.debugLabel,
    this.belowBuilder,
    this.bottomNavigationBar,
    this.renderSettings = true,
    this.scaffoldBackgroundColor,
  });

  final Widget child;
  final Widget drawer;
  final ThemeData theme;
  final String debugLabel;
  final TextStyle textStyle;
  final bool renderSettings;
  final Widget bottomNavigationBar;
  final Color scaffoldBackgroundColor;
  final void Function(BuildContext) init;
  final Widget Function(BuildContext) builder;
  final Widget Function(BuildContext context) belowBuilder;

  @override
  Widget build(BuildContext context) {
    if (this.init != null) {
      this.init(context);
    }
    return ChangeNotifierProvider<ScreenStateProvider>(
      create: (_) => ScreenStateProvider(),
      child: Theme(
        data: this.theme ?? Theme.of(context),
        child: AnimatedDefaultTextStyle(
          duration: Duration(milliseconds: 400),
          style: this.textStyle ?? DefaultTextStyle.of(context).style,
          child: Scaffold(
            drawer: this.drawer,
            bottomNavigationBar: this.bottomNavigationBar,
            backgroundColor: this.scaffoldBackgroundColor ??
                Theme.of(context).scaffoldBackgroundColor,
            body: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                this.belowBuilder != null
                    ? this.belowBuilder(context)
                    : Container(),
                Positioned.fill(
                  child: child ?? builder(context),
                ),
                this.renderSettings
                    ? Consumer<ScreenStateProvider>(
                        builder: (ctx, state, child) {
                          return ScreenSettingsModal(
                            isSettingsOpen: state.isSettingsOpen,
                            isSettingsMounted: state.isSettingsMounted,
                          );
                        },
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

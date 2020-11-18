import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/ScreenSettingsModal.dart';

import 'Provider.dart';

class Screen extends StatelessWidget {
  Screen({
    this.init,
    this.child,
    this.theme,
    this.drawer,
    this.builder,
    this.textStyle,
    this.debugLabel,
    this.fontFamily,
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
  final String fontFamily;
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

    final baseTheme = this.theme ?? Theme.of(context);

    return ChangeNotifierProvider<ScreenStateProvider>(
      create: (_) => ScreenStateProvider(),
      child: Theme(
        isMaterialAppTheme: true,
        data: baseTheme.copyWith(
          textTheme: baseTheme.textTheme.apply(fontFamily: this.fontFamily),
          primaryTextTheme:
              baseTheme.primaryTextTheme.apply(fontFamily: this.fontFamily),
          accentTextTheme:
              baseTheme.accentTextTheme.apply(fontFamily: this.fontFamily),
        ),
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
                  ? Selector<ScreenStateProvider, bool>(
                      selector: (_, state) => state.isSettingsOpen,
                      builder: (ctx, isSettingsOpen, child) {
                        return ScreenSettingsModal(
                          isSettingsOpen: isSettingsOpen,
                        );
                      },
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}

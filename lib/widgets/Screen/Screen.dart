import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_uis/configs/StatusBar.dart';
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
    this.belowBuilders,
    this.overlayBuilders,
    this.bottomNavigationBar,
    this.renderSettings = true,
    this.scaffoldBackgroundColor,
  });

  final Widget child;
  final Widget drawer;
  final ThemeData theme;
  final String debugLabel;
  final String fontFamily;
  final TextStyle textStyle;
  final bool renderSettings;
  final Widget bottomNavigationBar;
  final Color scaffoldBackgroundColor;
  final void Function(BuildContext) init;
  final Widget Function(BuildContext) builder;
  final List<Widget> belowBuilders;
  final List<Widget> overlayBuilders;

  @override
  Widget build(BuildContext context) {
    if (this.init != null) {
      this.init(context);
    }

    final baseTheme = this.theme ?? Theme.of(context);

    return ChangeNotifierProvider<ScreenStateProvider>(
      create: (_) => ScreenStateProvider(),
      child: Theme(
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
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: StatusBarHandler.get(
              context,
              ModalRoute.of(context).settings.name,
            ),
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                ...(this.belowBuilders ?? []),
                Positioned.fill(
                  child: child ?? builder(context),
                ),
                ...(this.overlayBuilders ?? []),
                Theme(
                  data: baseTheme.copyWith(
                    textTheme: baseTheme.textTheme.apply(
                      fontFamily: 'Muli',
                    ),
                    primaryTextTheme: baseTheme.primaryTextTheme.apply(
                      fontFamily: 'Muli',
                    ),
                    accentTextTheme: baseTheme.accentTextTheme.apply(
                      fontFamily: 'Muli',
                    ),
                  ),
                  child: this.renderSettings
                      ? Selector<ScreenStateProvider, bool>(
                          selector: (_, state) => state.isSettingsOpen,
                          builder: (ctx, isSettingsOpen, child) {
                            return ScreenSettingsModal(
                              isSettingsOpen: isSettingsOpen,
                            );
                          },
                        )
                      : Container(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

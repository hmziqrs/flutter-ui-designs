import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/AppTheme.dart';

import 'TestKeys.dart';

class StackFadeHeader extends StatelessWidget {
  StackFadeHeader({
    this.children,
    @required this.onTap,
    this.disableStack = false,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });

  final bool disableStack;
  final List<Widget> children;
  final void Function(BuildContext) onTap;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    final List<Widget> toRender = [
      InkResponse(
        key: Key(HeaderWidgetKey.backButton),
        onTap: () => this.onTap(context),
        child: Padding(
          padding: EdgeInsets.all(AppDimensions.padding * 2),
          child: Icon(
            Icons.chevron_left,
          ),
        ),
      ),
    ];
    if (this.children != null) {
      toRender.addAll(this.children);
    }

    Widget child = Material(
      color: Colors.transparent,
      child: Ink(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppTheme.background,
              AppTheme.background.withOpacity(0.01),
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: this.mainAxisAlignment,
          children: toRender,
        ),
      ),
    );

    if (disableStack) {
      return child;
    }

    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: child,
    );
  }
}

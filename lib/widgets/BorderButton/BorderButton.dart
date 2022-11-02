import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/AppTheme.dart';
import 'package:flutter_uis/configs/CommonProps.dart';

class BorderButton extends StatelessWidget {
  BorderButton({
    margin,
    this.child,
    this.color,
    this.testKey,
    this.onPressed,
    this.width = double.infinity,
    this.maxWidth = double.infinity,
  }) : this.margin = margin ?? EdgeInsets.all(AppDimensions.padding);

  final Color? color;
  final double width;
  final Widget? child;
  final double maxWidth;
  final String? testKey;
  final void Function()? onPressed;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: this.margin,
      child: InkWell(
        key: this.testKey != null ? Key(this.testKey!) : null,
        onTap: this.onPressed,
        borderRadius: CommonProps.buttonRadius,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: this.maxWidth),
          child: Ink(
            decoration: CommonProps.borderButton.copyWith(
              border: Border.all(
                color: this.color ?? AppTheme.primary,
                width: CommonProps.borderButton.border!.top.width,
              ),
            ),
            width: this.width,
            padding: EdgeInsets.symmetric(
              vertical: AppDimensions.padding * 1.5,
            ),
            child: DefaultTextStyle(
              child: this.child ?? SizedBox(),
              textAlign: TextAlign.center,
              style: DefaultTextStyle.of(context).style.copyWith(
                    color: this.color,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
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

  final Color color;
  final double width;
  final Widget child;
  final double maxWidth;
  final String testKey;
  final Function onPressed;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: this.margin,
      child: InkWell(
        key: Key(this.testKey),
        onTap: this.onPressed,
        // disabledColor: Colors.transparent,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: this.maxWidth),
          child: Ink(
            decoration: CommonProps.borderButton.copyWith(
              border: Border.all(
                color: this.color,
                width: CommonProps.borderButton.border.top.width,
              ),
            ),
            width: this.width,
            padding: EdgeInsets.symmetric(
              vertical: AppDimensions.padding * 1.3,
            ),
            child: DefaultTextStyle(
              child: this.child,
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

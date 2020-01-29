import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';

class BorderButton extends StatelessWidget {
  BorderButton({
    margin,
    this.child,
    this.color,
    this.onPressed,
    this.width = double.infinity,
    this.maxWidth = double.infinity,
  }) : this.margin = margin ?? EdgeInsets.all(AppDimensions.padding);

  final Color color;
  final double width;
  final Widget child;
  final double maxWidth;
  final Function onPressed;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      margin: this.margin,
      constraints: BoxConstraints(maxWidth: this.maxWidth),
      child: RaisedButton(
        elevation: 0.0,
        hoverElevation: 0.0,
        highlightElevation: 0.0,
        color: Colors.white,
        textColor: this.color,
        disabledColor: Colors.transparent,
        padding: EdgeInsets.symmetric(
          vertical: 12.0,
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: this.color, width: 2),
          borderRadius: BorderRadius.circular(4.0),
        ),
        onPressed: this.onPressed,
        child: this.child,
      ),
    );
  }
}

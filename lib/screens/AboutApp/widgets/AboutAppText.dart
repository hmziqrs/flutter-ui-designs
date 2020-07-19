import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';

class AboutAppText extends StatelessWidget {
  AboutAppText(this.string, {this.point = false, textStyle})
      : this.textStyle = textStyle ?? TextStyle();
  final String string;
  final bool point;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    final color = point ? Colors.black.withOpacity(0.6) : Colors.black;
    TextStyle style = TextStyle(
      fontSize: point ? 13 : 15,
      fontWeight: FontWeight.w600,
      color: color,
    ).merge(textStyle);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppDimensions.padding / 1.8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          point ? Text(" - ", style: style) : Container(),
          Flexible(
            child: Text(
              string,
              style: style,
            ),
          )
        ],
      ),
    );
  }
}

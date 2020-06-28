import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/Theme.dart' as theme;
import 'package:flutter_uis/configs/AppDimensions.dart';

import 'package:flutter_uis/Widgets/BorderButton/BorderButton.dart';

import '../Dimensions.dart';

class UIDetailButton extends StatelessWidget {
  UIDetailButton({
    @required this.callback,
    // @required this.callback,
    @required this.text,
  });

  final VoidCallback callback;
  final String text;

  @override
  Widget build(BuildContext context) {
    return BorderButton(
      maxWidth: 200,
      onPressed: callback,
      color: theme.primary,
      width: Dimensions.buttonWidth,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 7.5 * AppDimensions.ratio,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

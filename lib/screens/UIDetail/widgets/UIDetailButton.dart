import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/Theme.dart' as theme;

import 'package:flutter_uis/widgets/BorderButton/BorderButton.dart';

import '../Dimensions.dart';

class UIDetailButton extends StatelessWidget {
  UIDetailButton({
    required this.text,
    required this.testKey,
    required this.callback,
  });

  final String text;
  final String testKey;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return BorderButton(
      maxWidth: 200,
      onPressed: callback,
      color: theme.primary,
      testKey: this.testKey,
      width: Dimensions.buttonWidth,
      child: Text(
        text,
        style: TextStyle(),
      ),
    );
  }
}

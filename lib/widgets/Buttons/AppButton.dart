import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/TextStyles.dart';
import 'package:flutter_uis/configs/AppTheme.dart';

class AppButton extends StatelessWidget {
  AppButton({
    this.label,
    this.child,
    this.theme = 'default',
    this.padding = 2.5,
    this.margin = EdgeInsets.zero,
    this.width = double.infinity,
    required this.onTap,
  });

  final VoidCallback onTap;
  final String? label;
  final Widget? child;
  final String theme;
  final double padding;
  final EdgeInsets margin;
  final double width;

  @override
  Widget build(BuildContext context) {
    final theme = {
      'default': {
        'text': Colors.white,
        'background': AppTheme.primary,
      },
      'mode': {
        'text': AppTheme.background,
        'background': AppTheme.text,
      },
    };

    final check = theme[this.theme];
    Color text = theme['default']!['text']!;
    Color background = theme['default']!['background']!;
    if (check != null) {
      text = check['text']!;
      background = check['background']!;
    }

    return Container(
      margin: this.margin,
      width: this.width,
      child: TextButton(
        style: TextButton.styleFrom(
          // height: 0,
          textStyle: TextStyle(color: text),
          backgroundColor: background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTheme.buttonRadius),
          ),
          padding: EdgeInsets.symmetric(
            vertical: AppDimensions.padding * this.padding,
          ),

        ),
        child: this.child ??
            Text(
              label!,
              style: TextStyles.heading6,
            ),
        
        onPressed: this.onTap,
      ),
    );
  }
}

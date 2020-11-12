import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/TextStyles.dart';
import 'package:flutter_uis/configs/AppTheme.dart';

class BoxedButton extends StatelessWidget {
  BoxedButton({
    @required this.icon,
    @required this.label,
    @required this.onPressed,

    // Not Required
    margin,
  }) : this.margin = margin ?? EdgeInsets.all(AppDimensions.padding * 2);

  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: this.margin,
      constraints: BoxConstraints(
        minWidth: AppDimensions.ratio * 25 + 40,
      ),
      decoration: BoxDecoration(
        color: AppTheme.background,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            offset: Offset(0, 2.0),
            color: AppTheme.shadow,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: this.onPressed,
          borderRadius: BorderRadius.circular(8.0),
          child: Padding(
            padding: EdgeInsets.all(AppDimensions.padding * 2),
            child: Column(
              children: [
                Icon(
                  this.icon,
                  size: TextStyles.heading3.fontSize,
                ),
                SizedBox(height: AppDimensions.padding),
                Text(
                  this.label,
                  style: TextStyles.body37,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/AppTheme.dart';

class AlphaButton extends StatelessWidget {
  AlphaButton({
    // Required
    @required this.onTap,
    @required this.label,

    // Not required
    this.icon,
    this.margin = EdgeInsets.zero,

    // Assignable
    borderRadius,
  }) : this.borderRadius = borderRadius ?? BorderRadius.circular(8.0);

  final String label;
  final IconData icon;
  final EdgeInsets margin;
  final VoidCallback onTap;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    final hasIcon = this.icon != null;
    final textColor = AppTheme.text.withOpacity(0.1);

    return Padding(
      padding: this.margin,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: this.onTap,
          borderRadius: this.borderRadius,
          child: Container(
            decoration: BoxDecoration(
              color: textColor,
              borderRadius: this.borderRadius,
            ),
            padding: EdgeInsets.symmetric(
              vertical: AppDimensions.padding * 2,
              horizontal: AppDimensions.padding * 3,
            ),
            child: Row(
              children: [
                hasIcon
                    ? Icon(
                        this.icon,
                        size: 10 + AppDimensions.ratio * 4,
                      )
                    : SizedBox(),
                SizedBox(width: hasIcon ? AppDimensions.padding * 2 : 0.0),
                Text(
                  this.label,
                  style: TextStyle(
                    fontSize: 8 + AppDimensions.ratio * 3,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

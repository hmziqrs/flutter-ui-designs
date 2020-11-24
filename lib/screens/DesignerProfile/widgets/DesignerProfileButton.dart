import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/AppTheme.dart';

import 'package:flutter_uis/widgets/BorderButton/BorderButton.dart';

import '../Dimensions.dart';

class DesignerProfileButton extends StatelessWidget {
  DesignerProfileButton({
    @required this.label,
    @required this.onPress,
    @required this.icon,
    this.enable = false,
  });

  final String label;
  final bool enable;
  final IconData icon;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    Color color = enable ? AppTheme.primary : AppTheme.text03;

    return BorderButton(
      color: color,
      maxWidth: 200.0,
      onPressed: this.onPress,
      width: Dimensions.buttonWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.padding / 2,
            ),
            child: Icon(
              this.icon,
              color: color,
              size: 12 * AppDimensions.ratio,
            ),
          ),
          Text(
            this.label,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 7 * AppDimensions.ratio,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

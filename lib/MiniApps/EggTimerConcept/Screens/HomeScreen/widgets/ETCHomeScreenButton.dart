import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';

class ETCHomeScreenButton extends StatelessWidget {
  ETCHomeScreenButton({
    @required this.icon,
    @required this.label,
    @required this.onPress,
  });
  final String label;
  final IconData icon;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPress,
      padding: EdgeInsets.symmetric(vertical: AppDimensions.padding * 1.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.padding,
            ),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12 + AppDimensions.ratio * 6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

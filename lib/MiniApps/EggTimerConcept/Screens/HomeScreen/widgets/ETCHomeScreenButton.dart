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
      padding: EdgeInsets.symmetric(vertical: AppDimensions.padding * 1.5),
      onPressed: onPress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: AppDimensions.padding),
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

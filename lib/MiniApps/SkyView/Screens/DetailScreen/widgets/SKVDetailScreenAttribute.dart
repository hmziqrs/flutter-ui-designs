import 'package:flutter/material.dart';
import 'package:flutter_uis/configs/AppDimensions.dart';

import '../../../configs/theme.dart' as theme;

class SKVDetailScreenAttribute extends StatelessWidget {
  SKVDetailScreenAttribute({
    @required this.label,
    @required this.prefix,
    @required this.text,
    @required this.icon,
  });

  final String label;
  final String prefix;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: AppDimensions.padding * 2,
        bottom: AppDimensions.padding,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: AppDimensions.padding),
            child: Icon(this.icon, color: Colors.white),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 2.0),
                child: Text(
                  this.label,
                  style: TextStyle(
                    fontSize: 10.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                this.text,
                style: TextStyle(
                  fontSize: 20,
                  color: theme.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

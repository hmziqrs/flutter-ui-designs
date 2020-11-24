import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/AppTheme.dart';

class HABDetailScreenRowInfo extends StatelessWidget {
  const HABDetailScreenRowInfo(this.name, this.desc, this.icon,
      {this.fullWidth = false});
  final bool fullWidth;
  final IconData icon;
  final String name;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppDimensions.padding * 4,
        horizontal: AppDimensions.padding * 5,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: AppDimensions.padding * 0.4),
            child: Icon(
              icon,
              size: 16,
              color: AppTheme.primary,
            ),
          ),
          Flexible(
            child: Container(
              width: AppDimensions.padding * (this.fullWidth ? 80 : 50),
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.padding * 4,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: AppDimensions.padding),
                    child: Text(
                      desc,
                      style: TextStyle(
                        color: AppTheme.subText2,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

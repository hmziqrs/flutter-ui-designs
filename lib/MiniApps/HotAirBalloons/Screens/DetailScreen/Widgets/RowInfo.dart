import 'package:flutter/material.dart';

import '../../../configs/theme.dart' as theme;

import '../Dimensions.dart';

class RowInfo extends StatelessWidget {
  const RowInfo(this.name, this.desc, this.icon, {this.fullWidth = false});
  final bool fullWidth;
  final IconData icon;
  final String name;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.padding * 5,
        vertical: Dimensions.padding * 4,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: Dimensions.padding * 0.4),
            child: Icon(
              icon,
              color: theme.primary,
              size: 16,
            ),
          ),
          Flexible(
            child: Container(
              width: Dimensions.padding * (this.fullWidth ? 80 : 50),
              padding: EdgeInsets.only(left: Dimensions.padding * 4),
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
                    padding: EdgeInsets.only(top: 6),
                    child: Text(
                      desc,
                      style: TextStyle(
                        color: theme.subText.withOpacity(.6),
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

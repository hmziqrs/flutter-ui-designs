import 'package:flutter/material.dart';

import 'package:flutter_uis/UI.dart';

import '../../configs/theme.dart' as theme;

class RowInfo extends StatelessWidget {
  const RowInfo(this.name, this.desc, this.icon, {this.fullWidth = false});
  final String name;
  final String desc;
  final IconData icon;
  final bool fullWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(UI.horizontal * 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: UI.vertical * .4),
            child: Icon(
              icon,
              color: theme.primary,
              size: 16,
            ),
          ),
          Flexible(
            child: Container(
              width: UI.horizontal * (this.fullWidth ? 80 : 50),
              padding: EdgeInsets.only(left: UI.horizontal * 4),
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

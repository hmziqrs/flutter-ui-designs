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
        right: AppDimensions.padding * 2,
        bottom: AppDimensions.padding,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Icon(this.icon, color: Colors.white),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimensions.padding),
            child: Column(
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      this.text,
                      style: TextStyle(
                        fontSize: 20,
                        color: theme.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: AppDimensions.padding,
                        right: AppDimensions.padding,
                        bottom: 3,
                      ),
                      child: Text(
                        this.prefix,
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/Theme.dart' as theme;
import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/App.dart';

import 'package:flutter_uis/statics/models/UIItem.dart';

import '../messages/keys.dart';
import '../data.dart' as data;

class UIDetailSupport extends StatelessWidget {
  UIDetailSupport({@required this.uiItem});

  final UIItem uiItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppDimensions.padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.all(AppDimensions.padding)),
          Row(
            children: data.getSupportList(uiItem).map(
              (support) {
                final color = support["flag"] ? theme.primary : Colors.grey;
                return Flexible(
                  child: Center(
                    child: Column(
                      children: [
                        Icon(
                          support["icon"],
                          color: color,
                          size: 24,
                        ),
                        Padding(padding: EdgeInsets.only(top: 4)),
                        Text(
                          App.translate(support["label"], context),
                          style: TextStyle(
                            color: color,
                            fontSize: 5 * AppDimensions.ratio,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/Theme.dart' as theme;
import 'package:flutter_uis/configs/AppDimensions.dart';

import 'AboutDeveloperBody.dart';
import '../Dimensions.dart';

class AboutDeveloperContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyText1.copyWith(
          color: Colors.white,
        );

    return Column(
      children: <Widget>[
        Container(
          height: Dimensions.redBackground,
          decoration: BoxDecoration(
            color: theme.primary,
            boxShadow: [
              BoxShadow(
                color: theme.primary.withOpacity(0.4),
                blurRadius: 10,
                spreadRadius: 3,
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(AppDimensions.padding * 2),
          width: double.infinity,
          constraints: BoxConstraints(
            maxWidth: AppDimensions.maxContainerWidth,
          ),
          child: DefaultTextStyle(
            style: textStyle,
            // child: Container(),
            child: AboutDeveloperBody(),
          ),
        )
      ],
    );
  }
}

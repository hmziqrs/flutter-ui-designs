import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/Theme.dart' as theme;
import 'package:flutter_uis/configs/AppDimensions.dart';

import 'Dimensions.dart';

class HomeScreen extends StatelessWidget {
  final list = [
    {
      "label": "Explore UIs",
      "path": 'uiList',
      "icon": Icons.explore,
    },
    {
      "label": "About App",
      "path": "about",
      "icon": Icons.ac_unit,
    },
    {
      "label": "About Developer",
      "path": "aboutDesigner",
      "icon": Icons.ac_unit
    },
  ];

  List<Widget> renderList(BuildContext context) {
    return list
        .map(
          (item) => Container(
            width: double.infinity,
            child: OutlineButton(
              textColor: theme.primary,
              borderSide: BorderSide(
                color: theme.primary.withOpacity(0.2),
              ),
              highlightedBorderColor: theme.primary.withOpacity(0.8),
              onPressed: () => Navigator.of(context).pushNamed(item["path"]),
              child: Text(
                item["label"],
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext buildCtx) {
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        Dimensions.init(context);

        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Center(
              child: Container(
                width: double.infinity,
                constraints: BoxConstraints(
                  maxWidth: AppDimensions.maxContainerWidth,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.padding * 2,
                  vertical: AppDimensions.padding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "Explore elegantly crafted UIs with Google's Flutter designed by creative designers.",
                      style: TextStyle(
                        fontSize: 16,
                        color: theme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(AppDimensions.padding)),
                    ...this.renderList(context),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

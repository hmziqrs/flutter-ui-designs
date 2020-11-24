import 'package:flutter/material.dart';
import 'package:flutter_uis/configs/App.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/AppTheme.dart';

import '../../../configs/theme.dart' as theme;
import '../data.dart' as data;
import '../Dimensions.dart';

class HFDHomeScreenCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(
          maxWidth: AppDimensions.maxContainerWidth,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: data.categories
              .map(
                (category) => Ink(
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        width: Dimensions.categoryBaseSize,
                        height: Dimensions.categoryBaseSize,
                        decoration: BoxDecoration(
                          color: AppTheme.background,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 8,
                              offset: Offset(0, 6),
                              color: AppTheme.text01,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: category.margin,
                          child: Icon(
                            category.icon,
                            color: theme.primary,
                            size: category.iconSize,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(AppDimensions.padding * 0.8),
                      ),
                      Text(
                        App.translate(
                          category.name,
                          context,
                        ),
                        style: TextStyle(
                          fontSize: 8 + AppDimensions.ratio * 4,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import '../../../configs/theme.dart' as theme;
import '../Dimensions.dart';

class SKVHomeScreenSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final baseTheme = Theme.of(context);

    return Container(
      height: Dimensions.searchBarHeight,
      margin: EdgeInsets.all(AppDimensions.padding * 3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          Container(
            width: Dimensions.searchBarHeight,
            height: Dimensions.searchBarHeight,
            decoration: BoxDecoration(
              color: theme.primary,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  blurRadius: 15,
                  spreadRadius: 1,
                  color: theme.primary.withOpacity(0.35),
                  offset: Offset(5, 5),
                ),
              ],
            ),
            child: Icon(
              Icons.camera_enhance,
              color: Colors.white,
              size: 18,
            ),
          ),
          Flexible(
            child: TextField(
              cursorColor: theme.primary,
              style: baseTheme.textTheme.bodyText1.copyWith(
                fontSize: 8 + AppDimensions.ratio * 4,
              ),
              decoration: InputDecoration(
                hintText: "Search Planets, Stars, Satellite",
                hintStyle: baseTheme.inputDecorationTheme.hintStyle.copyWith(
                  color: theme.lightText,
                  fontWeight: FontWeight.w500,
                  fontSize: 8 + AppDimensions.ratio * 4,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.padding * 4,
                ),
              ),
            ),
          ),
          Container(
            width: Dimensions.searchBarHeight,
            height: Dimensions.searchBarHeight,
            child: Icon(
              Icons.search,
              size: 19,
              color: theme.lightText2,
            ),
          ),
        ],
      ),
    );
  }
}

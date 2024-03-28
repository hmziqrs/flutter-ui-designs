import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';

import '../../../configs/theme.dart' as theme;
import '../../../models/HFDFoodItem.dart';
import '../Dimensions.dart';

class HFDDetailScreenBackgroundImageBody extends StatelessWidget {
  HFDDetailScreenBackgroundImageBody({
    required this.item,
  });

  final HFDFoodItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      width: double.infinity,
      height: Dimensions.contentHeight,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.4),
      ),
      child: Container(
        height: double.infinity,
        width: AppDimensions.miniContainerWidth,
        padding: EdgeInsets.all(AppDimensions.padding * 2),
        margin: EdgeInsets.only(bottom: AppDimensions.padding * 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Row(
                  children: List.generate(
                    5,
                    (index) {
                      bool active =
                          this.item.stars.floor().clamp(1, 5) < (index + 1);
                      return Container(
                        child: Icon(
                          active
                              ? MaterialCommunityIcons.star_outline
                              : MaterialCommunityIcons.star,
                          color: theme.primary,
                        ),
                      );
                    },
                  ),
                ),
                Flexible(child: Container()),
                Container(
                  decoration: BoxDecoration(
                    color: theme.primary,
                    borderRadius: BorderRadius.all(
                      Radius.circular(100.0),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: AppDimensions.padding * 4,
                    vertical: AppDimensions.padding * 1.5,
                  ),
                  child: Text(
                    "\$ ${this.item.price.toStringAsFixed(2)}",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            Container(height: AppDimensions.padding * 3),
            Text(
              this.item.name,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white.withOpacity(0.88),
                fontSize: 12 + AppDimensions.ratio * 8,
              ),
            ),
            Container(height: AppDimensions.padding),
            Expanded(
              child: Text(
                this.item.description,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white.withOpacity(0.6),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

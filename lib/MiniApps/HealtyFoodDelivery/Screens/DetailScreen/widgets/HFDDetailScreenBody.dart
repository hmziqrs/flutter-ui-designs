import 'package:flutter/material.dart';
import 'package:flutter_uis/configs/App.dart';
import 'package:flutter_uis/configs/AppTheme.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/utils/Utils.dart';

import '../../../configs/theme.dart' as theme;
import '../../../models/HFDFoodItem.dart';
import '../messages/keys.dart';

class HFDDetailScreenBody extends StatelessWidget {
  HFDDetailScreenBody({
    required this.item,
    required this.bars,
    required this.circle,
  });

  final HFDFoodItem item;
  final double bars;
  final double circle;

  @override
  Widget build(BuildContext context) {
    final size = 20 + (AppDimensions.ratio * 20);
    final radius = size * 0.48;

    return Container(
      padding: EdgeInsets.all(AppDimensions.padding * 2),
      width: (AppDimensions.miniContainerWidth - AppDimensions.padding * 8),
      decoration: BoxDecoration(
        color: AppTheme.background,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 10.0,
            offset: Offset(0.0, 4.0),
            color: AppTheme.text02,
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(AppDimensions.padding * 2),
            child: Text(
              App.translate(
                HFDDetailScreenMessages.nutritionFact,
                context,
              ),
              style: TextStyle(
                fontSize: 10 + AppDimensions.ratio * 5,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Row(
            children: [
              Container(
                width: size,
                height: size,
                margin: EdgeInsets.only(
                  left: AppDimensions.padding * 2,
                  right: AppDimensions.padding * 2,
                ),
                child: CircularPercentIndicator(
                  radius: radius,
                  lineWidth: 4.5,
                  center: new Text(
                    "${item.kcal.toStringAsFixed(0)}",
                  ),
                  progressColor: theme.primary,
                  percent: this.circle,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${item.kcal.toStringAsFixed(0)} kcal",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "${item.dailyCal}% ${App.translate(
                      HFDDetailScreenMessages.dailyCalories,
                      context,
                    )}",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppTheme.subText3,
                    ),
                  ),
                ],
              ),
            ],
          ),
          this.buildLinearBar(
            item.carbo,
            App.translate(
              HFDDetailScreenMessages.carbo,
              context,
            ),
            this.bars,
          ),
          this.buildLinearBar(
            item.protien,
            App.translate(
              HFDDetailScreenMessages.protein,
              context,
            ),
            this.bars,
          ),
          this.buildLinearBar(
            item.fat,
            App.translate(
              HFDDetailScreenMessages.fat,
              context,
            ),
            this.bars,
          ),
        ],
      ),
    );
  }

  Widget buildLinearBar(int no, String label, double animate) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppDimensions.padding * 2,
        vertical: AppDimensions.padding * 1,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            flex: 6,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                height: 4 + AppDimensions.ratio * 1,
                child: LinearProgressIndicator(
                  value: Utils.rangeMap(animate, 0.0, 1.0, 0.0, no / 100),
                  backgroundColor: AppTheme.text03,
                  color: theme.primary,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              width: double.infinity,
              child: Text(
                "$no%",
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 5 + AppDimensions.ratio * 3,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              padding: EdgeInsets.only(left: AppDimensions.padding * 2),
              width: double.infinity,
              child: Text(
                label,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: AppTheme.subText3,
                  fontSize: 5 + AppDimensions.ratio * 4,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

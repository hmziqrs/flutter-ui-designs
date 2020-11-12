import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/AppTheme.dart';
import 'package:flutter_uis/configs/App.dart';

import 'package:flutter_uis/Utils.dart';
import 'package:flutter_uis/UI.dart';

import '../../../data/flights.dart' as data;
import '../messages/keys.dart';
import '../Dimensions.dart';

class HABDetailScreenFlightHeader extends StatelessWidget {
  HABDetailScreenFlightHeader({
    @required this.activePage,
    @required this.pageViewOffset,
  }) : this.flight = data.flights[activePage];

  final data.HABFlight flight;
  final int activePage;
  final double pageViewOffset;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      child: SafeArea(
        child: Container(
          height: Dimensions.backgroudImageHeight -
              (Dimensions.borderCliping * 1.8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: data.flights.asMap().entries.map(
                  (entry) {
                    double inputMin = UI.width * (entry.key - 1);
                    double inputMid = UI.width * (entry.key);
                    double inputMax = UI.width * (entry.key + 1);

                    double rangedOapcity = Utils.rangeL2LMap(
                      this.pageViewOffset,
                      inputMin,
                      inputMid,
                      inputMax,
                      0.0,
                      1.0,
                      0.0,
                    ).clamp(0.0, 1.0);

                    return Opacity(
                      opacity: rangedOapcity,
                      child: Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  App.translate(entry.value.name),
                                  style: TextStyle(
                                    fontSize: 30,
                                    // color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  " ${App.translate(HABDetailScreenMessages.flight)}",
                                  style: TextStyle(
                                    fontSize: 30,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              App.translate(entry.value.shortDesc),
                              style: TextStyle(
                                fontSize: 12.0,
                                // color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
              this.buildIndicators(),
            ],
          ),
        ),
      ),
    );
  }

  buildIndicators() {
    return Padding(
      padding: EdgeInsets.only(top: AppDimensions.padding * 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: data.flights
            .asMap()
            .entries
            .map(
              (entry) => Container(
                margin: EdgeInsets.symmetric(
                  horizontal: AppDimensions.padding * 0.5,
                ),
                width: AppDimensions.ratio * 3.5,
                height: AppDimensions.ratio * 3.5,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: entry.key == this.activePage
                      ? AppTheme.primary
                      : AppTheme.subText2,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

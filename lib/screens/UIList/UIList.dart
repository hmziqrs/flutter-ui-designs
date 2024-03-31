import 'package:flutter/material.dart';
import 'package:quiver/iterables.dart' as quiver;

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/statics/data/uiList.dart';
import 'package:flutter_uis/AppRoutes.dart';

import 'package:flutter_uis/widgets/Screen/Screen.dart';
import 'package:flutter_uis/widgets/UICard/UICard.dart';

import 'Dimensions.dart';
import 'TestKeys.dart';

class UIListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    final chunked = quiver.partition(uilist, Dimensions.chunks).toList();
    return Screen(
      child: SafeArea(
        bottom: false,
        top: false,
        child: ListView(
          key: Key(UIListScreenTestKeys.rootScroll),
          children: [
            SizedBox(height: AppDimensions.padding * 1.5),
            Row(
              children: [
                BackButton(),
                Text(
                  "Explore UIs",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            ...chunked.map(
              (chunked) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppDimensions.padding,
                  ),
                  child: Row(
                    children: chunked
                        .map(
                          (ui) => UICard(
                            ui,
                            onTap: () => Navigator.pushNamed(
                              context,
                              AppRoutes.uiDetail,
                              arguments: ui,
                            ),
                            cardWidth: Dimensions.cardWidth,
                            cardHeight: Dimensions.cardHeight,
                            padding: AppDimensions.padding * 2,
                          ),
                        )
                        .toList(),
                  ),
                );
              },
            ),
            SizedBox(height: AppDimensions.padding * 1.5),
          ],
        ),
      ),
    );
  }
}

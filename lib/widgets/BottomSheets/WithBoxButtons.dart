import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/TextStyles.dart';

import 'package:flutter_uis/widgets/Buttons/Boxed.dart';

import 'Base.dart';

void showBottomSheetWithBoxButtons({
  // Contexts
  BuildContext context,
  Function(BuildContext) appInit,
  Future<void> Function(BuildContext context) button1,
  Future<void> Function(BuildContext context) button2,

  // Strings
  String title,
  String label1,
  String label2,

  // Icons
  IconData icon1,
  IconData icon2,
}) {
  Scaffold.of(context).showBottomSheet(
    (bottomSheetContext) {
      appInit(bottomSheetContext);

      return BottomSheetBase(
        width: AppDimensions.maxContainerWidth,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              vertical: AppDimensions.padding * 1,
              horizontal: AppDimensions.padding * 2,
            ),
            child: Text(
              title,
              style: TextStyles.heading56,
            ),
          ),
          Row(
            children: [
              BoxedButton(
                icon: icon1,
                label: label1.toUpperCase(),
                onPressed: () => button1(bottomSheetContext),
              ),
              BoxedButton(
                icon: icon2,
                label: (label2).toUpperCase(),
                onPressed: () => button2(bottomSheetContext),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom),
        ],
      );
    },
    backgroundColor: Colors.transparent,
  );
}

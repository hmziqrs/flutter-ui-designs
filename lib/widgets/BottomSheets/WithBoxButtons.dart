import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/TextStyles.dart';

import 'package:flutter_uis/widgets/Buttons/Boxed.dart';

import 'Base.dart';

PersistentBottomSheetController showBottomSheetWithBoxButtons({
  // Contexts
  required BuildContext context,
  required Function(BuildContext) appInit,
  required Future<void> Function(BuildContext context) button1,
  required Future<void> Function(BuildContext context) button2,

  // Strings
  required String title,
  required String label1,
  required String label2,

  // Icons
  required IconData icon1,
  required IconData icon2,
}) {
  return Scaffold.of(context).showBottomSheet(
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

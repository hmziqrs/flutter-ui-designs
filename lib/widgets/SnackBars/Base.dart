import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/TextStyles.dart';
import 'package:flutter_uis/configs/AppTheme.dart';

void showSnackBarBase({
  required BuildContext context,
  Widget? child,
  required String text,
  required double width,
}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  final snackbar = SnackBar(
    elevation: 0.0,
    margin: EdgeInsets.zero,
    padding: EdgeInsets.zero,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: FittedBox(
      fit: BoxFit.scaleDown,
      child: Container(
        width: width,
        margin: EdgeInsets.symmetric(
          horizontal: AppDimensions.padding * 2,
        ),
        padding: EdgeInsets.symmetric(
          vertical: AppDimensions.padding * 2,
          horizontal: AppDimensions.padding * 2,
        ),
        decoration: BoxDecoration(
          color: AppTheme.background,
          borderRadius: BorderRadius.circular(6.0),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: AppTheme.shadow,
              offset: Offset(0.0, 4.0),
            ),
          ],
        ),
        child: child ??
            Text(
              text,
              style: TextStyles.body26.copyWith(
                color: AppTheme.text,
              ),
            ),
      ),
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}

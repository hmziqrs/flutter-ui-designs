import 'package:flutter/material.dart';
import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/AppTheme.dart';

class BottomSheetBase extends StatelessWidget {
  BottomSheetBase({
    this.width,
    @required this.children,
  });

  final double width;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Container(
          padding: EdgeInsets.all(AppDimensions.padding * 2),
          decoration: BoxDecoration(
            color: AppTheme.background,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(24.0),
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 16.0,
                color: AppTheme.shadow,
              )
            ],
          ),
          child: Container(
            width: this.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  child: Container(
                    height: 7.0,
                    width: AppDimensions.padding * 16,
                    margin: EdgeInsets.only(top: AppDimensions.padding),
                    decoration: BoxDecoration(
                      color: AppTheme.shadow,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                Container(height: AppDimensions.padding * 2),
                ...children,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

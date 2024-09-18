import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';

class ScreenSettingsSelect extends StatelessWidget {
  ScreenSettingsSelect({
    required this.onPress,
    required this.isActive,
    this.text,
    this.textChild,
    this.testKey,
  });

  final VoidCallback onPress;
  final bool isActive;
  final String? text;
  final Widget? textChild;
  final String? testKey;

  Color getIsActive(BuildContext context) {
    if (!this.isActive) {
      return Colors.transparent;
    }
    return Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.08);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: testKey != null ? Key(testKey!) : null,
      margin: EdgeInsets.only(
        top: AppDimensions.padding,
      ),
      width: double.infinity,
      child: InkWell(
        onTap: this.onPress,
        child: Container(
          color: this.getIsActive(context),
          padding: EdgeInsets.symmetric(
            vertical: AppDimensions.padding * 2,
            horizontal: AppDimensions.padding * 2.4,
          ),
          child: this.textChild ??
              Text(
                text ?? '',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
        ),
      ),
    );
  }
}

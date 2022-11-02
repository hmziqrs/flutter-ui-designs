import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/TextStyles.dart';
import 'package:flutter_uis/configs/AppTheme.dart';

class AboutUserJobTitle extends StatelessWidget {
  AboutUserJobTitle({
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppDimensions.padding * 2,
      ),
      child: Text(
        this.label,
        style: TextStyles.body17.copyWith(
          color: AppTheme.primary,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/AppTheme.dart';
import 'package:flutter_uis/configs/TextStyles.dart';
import 'package:flutter_uis/configs/App.dart';

import '../messages/keys.dart';

class HomeBuildVersion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: AppDimensions.padding * 3,
      ),
      width: double.infinity,
      child: Text(
        "${App.translate(HomeScreenMessages.version, context)} 2.0.1",
        textAlign: TextAlign.center,
        style: TextStyles.body27.copyWith(
          color: AppTheme.text.withOpacity(0.4),
        ),
      ),
    );
  }
}

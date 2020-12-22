import 'package:flutter/material.dart';
import 'package:flutter_uis/utils/Utils.dart';
import 'package:flutter_uis/configs/AppDimensions.dart';

class BackButton4Stack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: AppDimensions.padding * 2,
      child: Container(
        margin: Utils.safePaddingUnit(context, "top").add(
          EdgeInsets.symmetric(
            horizontal: AppDimensions.padding * 2,
          ),
        ),
        child: BackButton(),
      ),
    );
  }
}

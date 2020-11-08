import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/TextStyles.dart';

class AboutUserName extends StatelessWidget {
  AboutUserName({
    @required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppDimensions.padding * 2,
      ),
      child: Text(
        this.name,
        style: TextStyles.heading16,
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/Theme.dart' as theme;
import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/App.dart';
import 'package:flutter_uis/Utils.dart';

import 'package:flutter_uis/widgets/Screen/Screen.dart';

import 'widgets/AboutAppText.dart';
import 'messages/keys.dart';
import 'Dimensions.dart';

class AboutAppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);

    return Screen(
      child: SingleChildScrollView(
        child: Center(
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints(
              maxWidth: AppDimensions.maxContainerWidth,
            ),
            padding: Utils.safePaddingUnit(context, 'vertical').add(
              EdgeInsets.symmetric(
                horizontal: AppDimensions.padding * 2,
                vertical: AppDimensions.padding,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  App.translate(AboutAppScreenMessages.title),
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(AppDimensions.padding / 2),
                ),
                Text(
                  App.translate(AboutAppScreenMessages.description),
                  style: TextStyle(
                    fontSize: 16,
                    color: theme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(AppDimensions.padding * 1.5),
                ),
                AboutAppText(
                  App.translate(AboutAppScreenMessages.question1),
                ),
                AboutAppText(
                  App.translate(AboutAppScreenMessages.question2),
                  point: true,
                ),
                AboutAppText(
                  App.translate(AboutAppScreenMessages.question3),
                  point: true,
                ),
                AboutAppText(
                  App.translate(AboutAppScreenMessages.question4),
                  point: true,
                ),
                AboutAppText(
                  App.translate(AboutAppScreenMessages.question5),
                  point: true,
                ),
                AboutAppText(
                  App.translate(AboutAppScreenMessages.question6),
                  point: true,
                ),
                AboutAppText(
                  App.translate(AboutAppScreenMessages.question7),
                  point: true,
                ),
                AboutAppText(
                  App.translate(AboutAppScreenMessages.question8),
                  point: true,
                ),
                Padding(
                  padding: EdgeInsets.all(AppDimensions.padding * 1.5),
                ),
                AboutAppText(
                  App.translate(AboutAppScreenMessages.answer1),
                ),
                AboutAppText(
                  App.translate(AboutAppScreenMessages.answer2),
                  point: true,
                ),
                AboutAppText(
                  App.translate(AboutAppScreenMessages.answer3),
                  point: true,
                ),
                AboutAppText(
                  App.translate(AboutAppScreenMessages.answer4),
                  point: true,
                ),
                AboutAppText(
                  App.translate(AboutAppScreenMessages.answer5),
                  point: true,
                ),
                AboutAppText(
                  App.translate(AboutAppScreenMessages.answer6),
                  point: true,
                ),
                AboutAppText(
                  App.translate(AboutAppScreenMessages.answer7),
                  point: true,
                ),
                AboutAppText(
                  App.translate(AboutAppScreenMessages.answer8),
                  point: true,
                ),
                Padding(
                  padding: EdgeInsets.all(AppDimensions.padding * 1.5),
                ),
                AboutAppText(
                  App.translate(AboutAppScreenMessages.iDont),
                  textStyle: TextStyle(
                    color: theme.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

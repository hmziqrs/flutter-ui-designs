import 'package:flutter/material.dart';
import 'package:flutter_uis/widgets/Banners/Alpha.dart';
import 'package:flutter_uis/widgets/Header/Header.dart';

import 'package:flutter_uis/configs/Theme.dart' as theme;
import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/App.dart';
import 'package:flutter_uis/utils/Utils.dart';

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Header(
                  label: App.translate(
                    AboutAppScreenMessages.title,
                    context,
                  ),
                ),
                SizedBox(height: AppDimensions.padding * 3),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppDimensions.padding * 3,
                  ),
                  child: Text(
                    App.translate(AboutAppScreenMessages.description, context),
                    style: TextStyle(
                      fontSize: 16,
                      color: theme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: AppDimensions.padding * 2.0),
                AboutAppText(
                  App.translate(AboutAppScreenMessages.question1, context),
                ),
                AboutAppText(
                  App.translate(AboutAppScreenMessages.question2, context),
                  point: true,
                ),
                AboutAppText(
                  App.translate(AboutAppScreenMessages.question3, context),
                  point: true,
                ),
                AboutAppText(
                  App.translate(AboutAppScreenMessages.question4, context),
                  point: true,
                ),
                AboutAppText(
                  App.translate(AboutAppScreenMessages.question5, context),
                  point: true,
                ),
                AboutAppText(
                  App.translate(AboutAppScreenMessages.question6, context),
                  point: true,
                ),
                AboutAppText(
                  App.translate(AboutAppScreenMessages.question7, context),
                  point: true,
                ),
                AboutAppText(
                  App.translate(AboutAppScreenMessages.question8, context),
                  point: true,
                ),
                Padding(
                  padding: EdgeInsets.all(AppDimensions.padding * 1.5),
                ),
                AboutAppText(
                  App.translate(AboutAppScreenMessages.answer1, context),
                ),
                AboutAppText(
                  App.translate(AboutAppScreenMessages.answer2, context),
                  point: true,
                ),
                AboutAppText(
                  App.translate(AboutAppScreenMessages.answer3, context),
                  point: true,
                ),
                AboutAppText(
                  App.translate(AboutAppScreenMessages.answer4, context),
                  point: true,
                ),
                AboutAppText(
                  App.translate(AboutAppScreenMessages.answer5, context),
                  point: true,
                ),
                AboutAppText(
                  App.translate(AboutAppScreenMessages.answer6, context),
                  point: true,
                ),
                AboutAppText(
                  App.translate(AboutAppScreenMessages.answer7, context),
                  point: true,
                ),
                AboutAppText(
                  App.translate(AboutAppScreenMessages.answer8, context),
                  point: true,
                ),
                Padding(
                  padding: EdgeInsets.all(AppDimensions.padding * 1.5),
                ),
                AlphaBanner(
                  text: App.translate(AboutAppScreenMessages.iDont, context),
                ),
                SizedBox(
                  height: AppDimensions.padding * 3,
                ),
                Utils.safePadding(context, 'bottom'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

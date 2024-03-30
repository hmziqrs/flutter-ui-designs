import 'package:flutter/material.dart';
import 'package:flutter_uis/configs/AppTheme.dart';
import 'package:flutter_uis/configs/TextStyles.dart';
import 'package:flutter_uis/widgets/Banners/Alpha.dart';

import 'package:flutter_uis/configs/Theme.dart' as theme;
import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/App.dart';
import 'package:flutter_uis/utils/Utils.dart';
import 'package:flutter_uis/widgets/Header/Header.dart';

import 'package:flutter_uis/widgets/Screen/Screen.dart';

import 'messages/keys.dart';
import 'Dimensions.dart';


class AboutAppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);


    return Screen(
      child: Column(
        children: [
          Header(
            label: App.translate(
              AboutAppScreenMessages.title,
              context,
            ),
          ),
          Expanded(
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
                      SizedBox(height: AppDimensions.padding * 3),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppDimensions.padding * 3,
                        ),
                        child: Text(
                          App.translate(
                            AboutAppScreenMessages.description,
                            context,
                          ),
                          style: TextStyle(
                            fontSize: 16,
                            color: theme.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(AppDimensions.padding * 1.5),
                      ),
                      ...List.generate(
                        7,
                        (index) {
                          final i = index + 1;
                          final question = "$scope/question$i";
                          final answer = "$scope/answer$i";
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: AppDimensions.padding * 3,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(height: AppDimensions.padding * 1.0),
                                Text(
                                  App.translate(question, context),
                                  style: TextStyles.body17,
                                ),
                                SizedBox(height: AppDimensions.padding * 0.3),
                                Text(
                                  App.translate(answer, context),
                                  style: TextStyles.body26,
                                ),
                                SizedBox(height: AppDimensions.padding * 1.0),
                                if (index != 6)
                                  Divider(
                                    color: AppTheme.text.withOpacity(0.18),
                                    thickness: 1.4,
                                  ),
                              ],
                            ),
                          );
                        },
                      ),
                      SizedBox(height: AppDimensions.padding * 3),
                      AlphaBanner(
                        text: App.translate(
                          AboutAppScreenMessages.iDont,
                          context,
                        ),
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
          ),
        ],
      ),
    );
  }
}

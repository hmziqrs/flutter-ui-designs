import 'package:flutter/material.dart';
import 'package:flutter_uis/widgets/Banners/Alpha.dart';

import 'package:flutter_uis/configs/Theme.dart' as theme;
import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/App.dart';
import 'package:flutter_uis/utils/Utils.dart';
import 'package:flutter_uis/widgets/Header/Header.dart';

import 'package:flutter_uis/widgets/Screen/Screen.dart';

import 'widgets/AboutAppText.dart';
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
                        8,
                        (index) {
                          final i = index + 1;
                          final question = "$scope/question$i";
                          final answer = "$scope/answer$i";
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AboutAppText(App.translate(question, context)),
                              AboutAppText(App.translate(answer, context)),
                              Divider(),
                            ],
                          );
                        },
                      ),
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

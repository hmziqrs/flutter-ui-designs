import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/AppTheme.dart';
import 'package:flutter_uis/configs/App.dart';
import 'package:flutter_uis/configs/TextStyles.dart';

import 'package:flutter_uis/statics/models/UIItem.dart';
import 'package:flutter_uis/utils/Utils.dart';

import 'UIDetailSupport.dart';
import 'UIDetailMoreUIs.dart';
import 'UIDetailButton.dart';

import '../messages/keys.dart';
import '../TestKeys.dart';
import '../Provider.dart';

class UIDetailContent extends StatelessWidget {
  UIDetailContent({
    @required this.uiItem,
  });

  final UIItem uiItem;

  @override
  build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: AppDimensions.maxContainerWidth,
        ),
        padding: EdgeInsets.all(AppDimensions.padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.padding,
              ),
              child: Text(
                uiItem.name,
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.padding,
              ),
              child: Text(
                "${App.translate(UIDetailScreenMessages.by, context)} ${uiItem.designer}",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),
              ),
            ),
            (uiItem.description != null
                ? Container(
                    margin: EdgeInsets.only(top: AppDimensions.padding),
                    padding: EdgeInsets.symmetric(
                      horizontal: AppDimensions.padding,
                    ),
                    child: Text(
                      uiItem.description,
                      style: TextStyles.body26.copyWith(
                        color: AppTheme.subText2,
                      ),
                    ),
                  )
                : Container()),
            Padding(padding: EdgeInsets.all(AppDimensions.padding)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UIDetailButton(
                  testKey: UIDetailScreenTestKeys.openApp,
                  text: App.translate(
                    UIDetailScreenMessages.openApp,
                    context,
                  ),
                  callback: () => Navigator.of(context).pushNamed(
                    uiItem.miniApp,
                  ),
                ),
                UIDetailButton(
                  testKey: UIDetailScreenTestKeys.viewSource,
                  text: App.translate(
                    UIDetailScreenMessages.viewSource,
                    context,
                  ),
                  callback: () async {
                    await Utils.launchUrl(uiItem.link);
                  },
                ),
              ],
            ),
            UIDetailSupport(uiItem: uiItem),
            Padding(padding: EdgeInsets.all(AppDimensions.padding)),
            UIDetailMoreUIs(uiItem: uiItem),
            uiItem.designer != "anonymous"
                ? UIDetailButton(
                    testKey: UIDetailScreenTestKeys.viewDesigner,
                    text:
                        "${App.translate(UIDetailScreenMessages.contact)} ${uiItem.designer}",
                    callback: () async {
                      final screenState = UIDetailStateProvider.state(context);
                      await screenState.hide();
                      await Navigator.of(context).pushNamed(
                        "designerProfile",
                        arguments: {
                          "designer": uiItem.designer,
                          "id": uiItem.id,
                        },
                      );
                      await screenState.dDelayD;
                      UIDetailStateProvider.state(context).show();
                    },
                  )
                : Container(),
            Utils.safePadding(context, 'bottom'),
          ],
        ),
      ),
    );
  }
}

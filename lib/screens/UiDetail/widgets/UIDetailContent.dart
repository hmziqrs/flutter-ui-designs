import 'package:flutter/material.dart';

import 'package:flutter_uis/statics/models/UIItem.dart';
import 'package:flutter_uis/configs/App.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/Utils.dart';

import '../messages/keys.dart';
import 'UIDetailSupport.dart';
import 'UIDetailMoreUIs.dart';
import 'UIDetailButton.dart';
import '../Dimensions.dart';

class UIDetailContent extends StatelessWidget {
  UIDetailContent({
    @required this.uiItem,
    @required this.onLinkError,
    @required this.scrollOffset,
  });

  final UIItem uiItem;
  final double scrollOffset;
  final VoidCallback onLinkError;

  @override
  build(BuildContext context) {
    double safeOffset = -scrollOffset;

    if (safeOffset > Dimensions.coverImageHeight) {
      safeOffset = Dimensions.coverImageHeight;
    }
    return Center(
      child: Container(
        transform: Matrix4.identity()..translate(0.0, safeOffset),
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
                "${App.translate(UIDetailScreenMessages.by)} ${uiItem.designer}",
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
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                  )
                : Container()),
            Padding(padding: EdgeInsets.all(AppDimensions.padding)),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UIDetailButton(
                  text: App.translate(UIDetailScreenMessages.openApp),
                  callback: () => Navigator.of(context).pushNamed(
                    uiItem.miniApp,
                  ),
                ),
                UIDetailButton(
                  text: App.translate(UIDetailScreenMessages.viewSource),
                  callback: () async {
                    bool link = await Utils.launchUrl(uiItem.link);
                    if (!link) {
                      this.onLinkError();
                    }
                  },
                ),
              ],
            ),
            UIDetailSupport(uiItem: uiItem),
            Padding(padding: EdgeInsets.all(AppDimensions.padding)),
            UIDetailMoreUIs(uiItem: uiItem),
            uiItem.designer != "anonymous"
                ? UIDetailButton(
                    text:
                        "${App.translate(UIDetailScreenMessages.contact)} ${uiItem.designer}",
                    callback: () => Navigator.of(context).pushNamed(
                      "designerProfile",
                      arguments: {
                        "designer": uiItem.designer,
                        "id": uiItem.id,
                      },
                    ),
                  )
                : Container(),
            Padding(
              padding: EdgeInsets.only(
                top: safeOffset < 0 ? 0 : safeOffset,
              ),
            ),
            Utils.safePadding(context, 'bottom'),
          ],
        ),
      ),
    );
  }
}

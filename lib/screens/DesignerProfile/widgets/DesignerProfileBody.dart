import 'package:flutter/material.dart';
import 'package:flutter_uis/utils/Utils.dart';

import 'package:flutter_uis/statics/models/UIDesigner.dart';
import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/statics/models/UIItem.dart';

import 'DesignerProfileSocialMedia.dart';
import 'DesignerProfileFreelance.dart';
import 'DesignerProfileContactMe.dart';
import 'DesignerProfilePortfolio.dart';
import 'DesignerProfileMoreUIs.dart';
import '../Dimensions.dart';

class DesignerProfileBody extends StatelessWidget {
  DesignerProfileBody({
    this.uiList,
    this.designer,
    this.scrollOffset,
  });

  final UIDesigner designer;
  final double scrollOffset;
  final List<UIItem> uiList;

  @override
  Widget build(BuildContext context) {
    double safeOffset = -scrollOffset;

    if (safeOffset > Dimensions.coverImageHeight) {
      safeOffset = Dimensions.coverImageHeight;
    }

    return Center(
      child: Container(
        transform: Matrix4.identity()..translate(0.0, safeOffset),
        width: AppDimensions.maxContainerWidth,
        padding: EdgeInsets.all(AppDimensions.padding * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: Dimensions.avatarSize / 2,
                left: AppDimensions.padding,
                right: AppDimensions.padding,
              ),
              child: Text(
                designer.name,
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            designer.description != null
                ? Padding(
                    padding: EdgeInsets.fromLTRB(
                      AppDimensions.padding,
                      AppDimensions.padding,
                      AppDimensions.padding,
                      0,
                    ),
                    child: Text(
                      designer.description,
                      style: TextStyle(
                        // fontSize: 28.0,
                        color: Colors.black.withOpacity(0.45),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                : Container(),
            Padding(padding: EdgeInsets.all(AppDimensions.padding)),
            DesignerProfileSocialMedia(designer: designer),
            Padding(padding: EdgeInsets.all(AppDimensions.padding)),
            DesignerProfilePortfolio(designer: designer),
            Padding(padding: EdgeInsets.all(AppDimensions.padding)),
            DesignerProfileFreelance(designer: designer),
            Padding(padding: EdgeInsets.all(AppDimensions.padding)),
            DesignerProfileContactMe(designer: designer),
            Padding(padding: EdgeInsets.all(AppDimensions.padding)),
            DesignerProfileMoreUIs(designer: designer, uiList: uiList),
            Utils.safePadding(context, "bottom"),
            Padding(
              padding: EdgeInsets.only(top: safeOffset < 0 ? 0 : safeOffset),
            )
          ],
        ),
      ),
    );
  }
}

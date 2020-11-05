import 'package:flutter/material.dart';
import 'package:flutter_uis/configs/AppDimensions.dart';

import 'package:flutter_uis/statics/data/uiDesigners.dart';
import 'package:flutter_uis/statics/data/uiList.dart';

import 'package:flutter_uis/widgets/Screen/Screen.dart';

import 'widgets/DesignerProfileAvatar.dart';
import 'widgets/DesignerProfileBody.dart';
import 'Dimensions.dart';

class DesignerProfileScreen extends StatefulWidget {
  @override
  _DesignerProfileScreenState createState() => _DesignerProfileScreenState();
}

class _DesignerProfileScreenState extends State<DesignerProfileScreen>
    with SingleTickerProviderStateMixin {
  ScrollController scrollController;
  double scrollOffset = 0.0;

  @override
  void initState() {
    super.initState();

    this.scrollController = ScrollController();
    this.scrollController.addListener(() {
      final offset = this.scrollController.offset;
      setState(() {
        scrollOffset = -offset;
      });
    });
  }

  @override
  void dispose() {
    this.scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);

    final Map obj = ModalRoute.of(context).settings.arguments;
    final String username = obj["designer"];
    List<UIItem> uiList =
        uilist.where((ui) => ui.designer == username).toList();
    UIDesigner designer =
        uiDesigners.firstWhere((user) => user.username == username);

    double coverImageHeight = Dimensions.coverImageHeight + scrollOffset;

    if (coverImageHeight < 0) {
      coverImageHeight = 0;
    }

    return Screen(
      child: SingleChildScrollView(
        controller: this.scrollController,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  transform: Matrix4.identity()
                    ..translate(
                      0.0,
                      -scrollOffset,
                    ),
                  height: coverImageHeight,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: ExactAssetImage(designer.cover),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                DesignerProfileBody(
                  uiList: uiList,
                  designer: designer,
                  scrollOffset: this.scrollOffset,
                ),
              ],
            ),
            DesignerProfileAvatar(username: designer.username),
            Positioned(
              top: MediaQuery.of(context).padding.top,
              child: Padding(
                padding: EdgeInsets.all(AppDimensions.padding),
                child: BackButton(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:flutter_uis/statics/data/uiList.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';

import 'package:flutter_uis/Widgets/Screen/Screen.dart';

import 'widgets/UIDetailCoverImage.dart';
import 'widgets/UIDetailContent.dart';
import 'Dimensions.dart';

class UIDetailScreen extends StatefulWidget {
  @override
  _UIDetailScreenState createState() => _UIDetailScreenState();
}

class _UIDetailScreenState extends State<UIDetailScreen>
    with SingleTickerProviderStateMixin {
  double scrollOffset = 0.0;
  ScrollController scrollController;
  final screenKey = GlobalKey<ScreenState>();

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
    final UIItem uiItem = ModalRoute.of(context).settings.arguments;

    return Screen(
      Dimensions.init,
      key: this.screenKey,
      builder: (_) {
        return SingleChildScrollView(
          controller: this.scrollController,
          child: Stack(
            children: [
              Column(
                children: [
                  UIDetailCoverImage(
                    scrollOffset: this.scrollOffset,
                    uiItem: uiItem,
                  ),
                  UIDetailContent(
                    uiItem: uiItem,
                    scrollOffset: this.scrollOffset,
                    onLinkError: this.screenKey.currentState.showPopUp,
                  )
                ],
              ),
              Positioned(
                top: MediaQuery.of(context).padding.top + AppDimensions.padding,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppDimensions.padding,
                  ),
                  child: BackButton(
                    onPressed: () => Navigator.of(context).popUntil(
                      ModalRoute.withName("uiList"),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

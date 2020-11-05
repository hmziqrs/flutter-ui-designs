import 'package:flutter/material.dart';
import 'package:quiver/iterables.dart' as quiver;

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/statics/data/uiList.dart';
import 'package:flutter_uis/Utils.dart';

import 'package:flutter_uis/widgets/Screen/Screen.dart';
import 'package:flutter_uis/widgets/UICard/UICard.dart';

import 'Dimensions.dart';
import 'TestKeys.dart';

class UIListScreen extends StatefulWidget {
  @override
  _UIListScreenState createState() => _UIListScreenState();
}

class _UIListScreenState extends State<UIListScreen>
    with SingleTickerProviderStateMixin {
  double scrollStart = 0.0;
  double offset = 0.0;

  ScrollController scrollController;
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    this.animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));

    this.animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        this.animationController.reset();
        setState(() {
          this.offset = 0.0;
        });
      }
    });

    super.initState();
  }

  bool onScrollNotification(ScrollNotification notification) {
    setState(() {
      if (notification.runtimeType == ScrollStartNotification) {
        this.scrollStart = notification.metrics.pixels;
      }
      if (notification.runtimeType == ScrollUpdateNotification) {
        this.offset = ((this.scrollStart - notification.metrics.pixels) * 0.5)
            .clamp(-120.0, 120.0);
      }
      if (notification.runtimeType == ScrollEndNotification) {
        this.animation = new Tween(begin: this.offset, end: 0.0)
            .animate(this.animationController);
        this.animation.addListener(() {
          // setState(() {
          this.offset = this.animation.value;
          // });
        });

        this.animationController.forward();
      }
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    final chunked = quiver.partition(uilist, Dimensions.chunks).toList();
    return Screen(
      child: SafeArea(
        bottom: false,
        top: false,
        child: CustomScrollView(
          key: Key(UIListScreenTestKeys.rootScroll),
          slivers: [
            Utils.safePadding(context, 'top', true),
            SliverPadding(
              padding: EdgeInsets.all(AppDimensions.padding),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.padding * 3,
                ),
                child: Text(
                  "Explore UIs",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.padding * 3,
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(AppDimensions.padding),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (ctx, index) {
                    return Row(
                      children: chunked[index]
                          .map(
                            (ui) => UICard(
                              ui,
                              prespectiveScale: 0.0,
                              cardWidth: Dimensions.cardWidth,
                              cardHeight: Dimensions.cardHeight,
                              padding: AppDimensions.padding * 2,
                            ),
                          )
                          .toList(),
                    );
                  },
                  childCount: chunked.length,
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(AppDimensions.padding * 3),
            ),
            Utils.safePadding(context, 'bottom', true),
          ],
        ),
      ),
    );
  }
}

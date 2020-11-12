import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/App.dart';
import 'package:flutter_uis/Utils.dart';
import 'package:flutter_uis/configs/AppTheme.dart';

import 'ASCHomeScreenContentColorFilters.dart';
import 'ASCHomeScreenContentPriceBadge.dart';
import '../../../data/data.dart' as data;
import 'ASCHomeScreenContentBadge.dart';
import 'ASCHomeScreenContentSizes.dart';
import 'ASCHomeScreenContentStars.dart';
import '../messages/keys.dart';

class ASCHomeScreenContent extends StatefulWidget {
  ASCHomeScreenContent({
    this.item,
    this.activePage,
    this.uiParallax,
    this.changeColor,
    this.activeColor,
    this.activeColorIndex,
  });

  final int activePage;
  final double uiParallax;
  final data.ASCItem item;
  final Color activeColor;
  final int activeColorIndex;
  final void Function(Color, int) changeColor;

  @override
  _ASCHomeScreenContentState createState() => _ASCHomeScreenContentState();
}

class _ASCHomeScreenContentState extends State<ASCHomeScreenContent> {
  int activeSize;
  final List<int> sizes = [7, 8, 9, 10, 11];

  @override
  void initState() {
    this.activeSize = this.sizes[0];
    super.initState();
  }

  void setSize(int size) {
    setState(() {
      this.activeSize = size;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.maxContainerWidth,
      margin: EdgeInsets.only(top: AppDimensions.padding * 2),
      padding: EdgeInsets.all(AppDimensions.padding * 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.item.contentHeading,
                    style: TextStyle(
                      fontSize: 8 + AppDimensions.ratio * 8,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Container(height: AppDimensions.padding),
                  Text(
                    App.translate(widget.item.contentSubHeading),
                    style: TextStyle(
                      color: AppTheme.subText3,
                      fontWeight: FontWeight.w700,
                      fontSize: 6 + AppDimensions.ratio * 5,
                    ),
                  ),
                ],
              ),
              ASCHomeScreenContentBadge(
                uiParallax: widget.uiParallax,
                activeColor: widget.activeColor,
              ),
            ],
          ),
          Container(height: AppDimensions.padding * 2),
          ASCHomeScreenContentStars(
            item: widget.item,
            uiParallax: widget.uiParallax,
            activeColor: widget.activeColor,
          ),
          Container(height: AppDimensions.padding * 6),
          Text(
            App.translate(ASCHomeScreenMessages.size),
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 8 + AppDimensions.ratio * 6,
            ),
          ),
          Container(height: AppDimensions.padding * 2),
          ASCHomeScreenContentSizes(
            sizes: this.sizes,
            setSize: this.setSize,
            activeSize: this.activeSize,
            activePage: widget.activePage,
            uiParallax: widget.uiParallax,
            activeColor: widget.activeColor,
          ),
          Container(height: AppDimensions.padding * 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ASCHomeScreenContentColorFilters(
                item: widget.item,
                activePage: widget.activePage,
                changeColor: widget.changeColor,
                uiParallax: widget.uiParallax,
                activeColor: widget.activeColor,
                activeColorIndex: widget.activeColorIndex,
              ),
              ASCHomeScreenContentPriceBadge(
                item: widget.item,
                uiParallax: widget.uiParallax,
                activeColor: widget.activeColor,
              ),
            ],
          ),
          Utils.safePadding(context, "bottom"),
        ],
      ),
    );
  }
}

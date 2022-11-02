import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_uis/Mixins/HoverWidget.dart';
import 'package:flutter_uis/utils/Utils.dart';
import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../../../configs/theme.dart' as theme;
import '../../../models/HFDFoodItem.dart';
import '../Dimensions.dart';

class HFDHomeScreenItemCard extends StatefulWidget {
  final HFDFoodItem item;
  HFDHomeScreenItemCard(this.item, {Key? key}) : super(key: key);

  @override
  _HFDHomeScreenItemCardState createState() => _HFDHomeScreenItemCardState();
}

class _HFDHomeScreenItemCardState extends State<HFDHomeScreenItemCard>
    with HoverWidgetMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        width: Dimensions.itemBaseWidth,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
              top: 0,
              bottom: 0,
              left: AppDimensions.padding * 3,
              right: Dimensions.itemDiscountSize * 0.4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: this.buildInkWell(
                  key: Key(this.widget.item.testKey),
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      "hfdDetail",
                      arguments: widget.item,
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(widget.item.image),
                      ),
                    ),
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(
                          Utils.rangeMap(animation.value, 0.0, 1.0, 0.3, 0.0),
                        ),
                      ),
                      child: Container(
                        height: 130,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(
                            Utils.rangeMap(
                                animation.value, 0.0, 1.0, 0.0, 0.20),
                          ),
                        ),
                        child: ClipRRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(
                                    AppDimensions.padding * 3,
                                  ).copyWith(
                                    right: Dimensions.itemDiscountSize * 0.5,
                                    bottom: 0,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        widget.item.name,
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white.withOpacity(
                                            0.88,
                                          ),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        widget.item.description,
                                        maxLines: 2,
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.6),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Flexible(child: Container()),
                                Container(
                                  padding: EdgeInsets.only(
                                    right: AppDimensions.padding * 3,
                                    left: AppDimensions.padding * 3,
                                    bottom: AppDimensions.padding * 2,
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        MaterialCommunityIcons.star,
                                        color: theme.primary,
                                        size: 18.0,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: 1.0,
                                          left: AppDimensions.padding,
                                        ),
                                        child: Text(
                                          widget.item.stars.toStringAsFixed(2),
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Flexible(child: Container()),
                                      Icon(
                                        MaterialCommunityIcons
                                            .map_marker_outline,
                                        color: Colors.white,
                                        size: 16.0,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: AppDimensions.padding,
                                        ),
                                        child: Text(
                                          "${widget.item.location.toStringAsFixed(2)} km",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: Dimensions.itemDiscountSize * 0.8,
              right: 0,
              child: Container(
                width: Dimensions.itemDiscountSize,
                height: Dimensions.itemDiscountSize,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: theme.primary,
                ),
                child: Text(
                  "\$${widget.item.price.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: Dimensions.itemDiscountSize * 0.25,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

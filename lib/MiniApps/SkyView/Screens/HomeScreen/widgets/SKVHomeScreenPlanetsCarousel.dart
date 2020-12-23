import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/App.dart';
import 'package:flutter_uis/utils/Utils.dart';

import '../../../configs/theme.dart' as theme;
import '../../../data/data.dart' as data;
import '../Dimensions.dart';
import '../TestKeys.dart';
import '../Provider.dart';

import 'SKVHomeScreenStarField.dart';

class SKVHomeScreenPlanetsCarousel extends StatelessWidget {
  void onTap(BuildContext context, int index) {
    Navigator.of(context).pushNamed(
      "skvDetail",
      arguments: index,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: AppDimensions.padding * 2),
      height: Dimensions.carouselHeight,
      child: ListView.builder(
        key: Key(SKVHomeScreenTestKeys.planetsScroll),
        physics: BouncingScrollPhysics(),
        padding: Utils.safePaddingUnit(context, 'horizontal').add(
          EdgeInsets.symmetric(horizontal: AppDimensions.padding * 3),
        ),
        scrollDirection: Axis.horizontal,
        itemCount: data.objectList.length,
        itemBuilder: (BuildContext context, int index) {
          final item = data.objectList[index];
          return GestureDetector(
            key: Key(item.testKey),
            onTap: () => this.onTap(context, index),
            child: Container(
              width: Dimensions.carouselCardWidth,
              margin: EdgeInsets.only(right: AppDimensions.padding * 2),
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  // Background
                  Positioned.fill(
                    top: AppDimensions.padding * 6,
                    bottom: AppDimensions.padding * 3,
                    right: App.isLtr ? AppDimensions.padding * 6 : 0.0,
                    left: !App.isLtr ? AppDimensions.padding * 6 : 0.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24.0),
                      child: Container(
                        alignment:
                            App.isLtr ? Alignment.topRight : Alignment.topLeft,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            stops: [0.5, 1.0],
                            begin: App.isLtr
                                ? Alignment.topRight
                                : Alignment.topLeft,
                            end: App.isLtr
                                ? Alignment.bottomLeft
                                : Alignment.bottomRight,
                            colors: [theme.gradient1, theme.gradient2],
                          ),
                        ),
                        child: Stack(
                          children: <Widget>[
                            Consumer<SKVHomeState>(
                              builder: (context, state, child) {
                                return SKVHomeScreenStarField(
                                  key: Key("${AppDimensions.size.toString()}"),
                                  scrollX: state.offsetX,
                                  scrollY: state.offsetY,
                                );
                              },
                            ),
                            Positioned(
                              top: -Dimensions.carouselPlanetSize * .05,
                              right: App.isLtr
                                  ? -Dimensions.carouselPlanetSize * .05
                                  : null,
                              left: !App.isLtr
                                  ? -Dimensions.carouselPlanetSize * .05
                                  : null,
                              child: Container(
                                width: Dimensions.carouselPlanetSize * 0.95,
                                height: Dimensions.carouselPlanetSize * 0.95,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.transparent,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 26,
                                      spreadRadius: 4,
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Add Icon
                  Positioned(
                    right: App.isLtr ? AppDimensions.padding * 3 : null,
                    left: !App.isLtr ? AppDimensions.padding * 3 : null,
                    bottom: 0,
                    child: Container(
                      width: Dimensions.carouselAddIconSize,
                      height: Dimensions.carouselAddIconSize,
                      decoration: BoxDecoration(
                        color: theme.primary,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.add_circle_outline,
                          size: 22,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  // Planet
                  Positioned(
                    right: App.isLtr ? AppDimensions.padding * 1 : null,
                    left: !App.isLtr ? AppDimensions.padding * 1 : null,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        Dimensions.carouselPlanetSize,
                      ),
                      child: Container(
                        width: Dimensions.carouselPlanetSize,
                        foregroundDecoration: BoxDecoration(
                          gradient: RadialGradient(
                            center: Alignment.topRight,
                            colors: [
                              Colors.transparent,
                              Colors.transparent,
                              Colors.black.withOpacity(0.9),
                            ],
                            radius: 1.1,
                          ),
                        ),
                        child: Image.asset(
                          item.image,
                        ),
                      ),
                    ),
                  ),
                  // Text Content
                  Positioned(
                    bottom: AppDimensions.padding * 5,
                    left: App.isLtr ? AppDimensions.padding * 2 : null,
                    right: !App.isLtr ? AppDimensions.padding * 2 : null,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          item.name,
                          style: TextStyle(
                            fontSize: 15 + AppDimensions.ratio * 10,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          App.translate(
                            item.nickname,
                            context,
                          ),
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: theme.primary,
                            fontSize: 7 + AppDimensions.ratio * 6,
                          ),
                        ),
                        Text(
                          App.translate(
                            item.positionInSystem,
                            context,
                          ),
                          style: TextStyle(
                            fontSize: 4 + AppDimensions.ratio * 4,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: AppDimensions.padding * 2,
                          ),
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

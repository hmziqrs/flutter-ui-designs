import 'package:flutter/material.dart';

import 'package:flutter_uis/UI.dart';
import 'package:flutter_uis/Utils.dart';

import '../../../configs/theme.dart' as theme;
import '../../../data/data.dart' as data;

import '../../DetailScreen/SKDetailScreen.dart';

import '../Dimensions.dart';

class ObjectsCarousel extends StatelessWidget {
  const ObjectsCarousel({Key key}) : super(key: key);

  background() {
    return Positioned.fill(
      bottom: UI.vertical * 3,
      top: Dimensions.carouselHeight * .12,
      right: Dimensions.carouselCardWidth * .1,
      child: ClipRect(
        child: Container(
          alignment: Alignment.topRight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.0),
            gradient: LinearGradient(
              stops: [0.5, 1.0],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [theme.gradient1, theme.gradient2],
            ),
          ),
          child: Container(
            width: Dimensions.carouselPlanetSize * .9,
            height: Dimensions.carouselPlanetSize * .9,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              boxShadow: [
                BoxShadow(
                  blurRadius: 26,
                  spreadRadius: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  addIcon() {
    return Positioned(
      right: Dimensions.padding,
      bottom: Dimensions.padding,
      child: Container(
        width: 50,
        height: 50,
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
    );
  }

  texts(item) {
    return Positioned(
      top: null,
      bottom: Dimensions.padding * 5,
      left: Dimensions.padding * 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            item.name,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          Text(
            item.nickname,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: theme.primary,
            ),
          ),
          Text(
            item.positionInSystem,
            style: TextStyle(
              fontSize: 10,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: UI.vertical * 1),
            child: Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: Dimensions.padding * 3,
      ),
      height: Dimensions.carouselHeight,
      child: ListView.builder(
        padding: Utils.safePaddingUnit(context, 'horizontal').add(
          EdgeInsets.only(left: Dimensions.padding * 2),
        ),
        scrollDirection: Axis.horizontal,
        itemCount: data.objectList.length,
        itemBuilder: (BuildContext context, int index) {
          final item = data.objectList[index];
          return GestureDetector(
            onTap: () => Navigator.of(context).push(
              new SKDetailScreen(index),
            ),
            child: Container(
              margin: EdgeInsets.only(right: Dimensions.padding * 2),
              width: Dimensions.carouselCardWidth,
              child: Stack(
                children: <Widget>[
                  this.background(),
                  this.addIcon(),
                  Positioned(
                    right: 0,
                    child: Image.asset(
                      item.image,
                      width: Dimensions.carouselPlanetSize,
                    ),
                  ),
                  this.texts(item),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

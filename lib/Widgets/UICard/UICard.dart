import 'package:flutter/material.dart';

import 'package:flutter_uis/blocs/ui_bloc/bloc.dart';

import 'package:flutter_uis/configs/Theme.dart' as theme;

// import '../../../configs/theme.dart' as theme;

class UICard extends StatelessWidget {
  const UICard(
    this.item, {
    this.padding,
    this.cardWidth,
    this.cardHeight,
    this.isMini = false,
  });
  final UIItem item;
  final bool isMini;
  final double padding;
  final double cardWidth;
  final double cardHeight;

  backgroundImage(BorderRadius borderRadius) {
    return Hero(
      transitionOnUserGestures: true,
      tag: "thumbnail-${this.item.id}",
      child: Container(
        margin: EdgeInsets.all(this.padding),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage(this.item.thumbnail),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            this.isMini
                ? BoxShadow(
                    spreadRadius: 0.0,
                    blurRadius: 6.0,
                    offset: Offset(0.0, 3.0),
                    color: Colors.black.withOpacity(0.25),
                  )
                : BoxShadow(
                    spreadRadius: 0.0,
                    blurRadius: 8.0,
                    offset: Offset(0.0, 4.0),
                    color: Colors.black.withOpacity(0.35),
                  )
          ],
          borderRadius: borderRadius,
        ),
        foregroundDecoration: BoxDecoration(
          color: Colors.black.withOpacity(0.08),
          borderRadius: borderRadius,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              stops: [0.25, 1.0],
              colors: [theme.primary, theme.primary.withOpacity(0.1)],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const borderRadius = BorderRadius.all(
      Radius.circular(6.0),
    );
    // Utils.printDebug("${this.item.id} / ${this.item.name}");
    return GestureDetector(
      onTap: () => this.isMini
          ? Navigator.of(context).pushReplacementNamed(
              "uiDetail",
              arguments: this.item,
            )
          : Navigator.of(context).pushNamed(
              "uiDetail",
              arguments: this.item,
            ),
      child: Container(
        width: this.cardWidth,
        height: this.cardHeight,
        // constraints: BoxConstraints(
        //   minHeight: this.isMini ? 100 : 160,
        //   maxHeight: this.isMini ? 160 : 280,
        // ),
        alignment: Alignment.center,
        child: Stack(
          children: <Widget>[
            this.backgroundImage(borderRadius),
            Positioned(
              top: this.padding,
              bottom: this.padding,
              right: this.padding,
              left: this.padding,
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(this.padding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        this.item.name,
                        style: TextStyle(
                          fontSize: this.isMini ? 20.0 : 24.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      !this.isMini
                          ? Text(
                              "By ${this.item.designer}",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.0,
                              ),
                            )
                          : Container(),
                    ],
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

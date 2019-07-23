import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import './list.dart';

class UiListScreen extends StatelessWidget {
  renderList(context) {
    final double cardHeight = MediaQuery.of(context).size.height * .33;
    const borderRadius = BorderRadius.all(
      Radius.circular(6.0),
    );
    int index = -1;

    return uilists.map((ui) {
      index += 1;
      return GestureDetector(
        onTap: () =>
            Navigator.of(context).pushNamed("uiDetail", arguments: index),
        child: Container(
          height: cardHeight,
          child: Stack(
            children: <Widget>[
              Hero(
                tag: "thumbnail",
                child: Container(
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: ExactAssetImage(ui["thumbnail"]),
                      fit: BoxFit.cover,
                    ),
                    // color: Colors.red,
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 2.0,
                        blurRadius: 5.0,
                        offset: Offset(0.0, 2.0),
                        color: Colors.grey[500],
                      )
                    ],
                    borderRadius: borderRadius,
                  ),
                ),
              ),
              Positioned(
                right: 16,
                top: 16,
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Colors.red[300], Colors.red[900]],
                    ),
                  ),
                  child: Icon(
                    MaterialCommunityIcons.dribbble,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                top: 8,
                bottom: 8,
                right: 8,
                left: 8,
                child: Hero(
                  tag: 'ui-name',
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: borderRadius,
                        gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          stops: [0.15, 1.0],
                          colors: [
                            Colors.black,
                            Colors.black.withOpacity(0.00)
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              ui["name"],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.0,
                              ),
                            ),
                            Text(
                              "By ${ui["designer"]}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ui Lists"),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Result: ${uilists.length}"),
                ),
              ],
            ),
            ...this.renderList(context),
          ],
        ),
      ),
    );
  }
}

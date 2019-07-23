import 'package:flutter/material.dart';

import '../UiList/list.dart';

class UiDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int args = ModalRoute.of(context).settings.arguments;
    final ui = uilists[args];

    print(args);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Hero(
                  tag: "thumbnail",
                  child: Container(
                    height: MediaQuery.of(context).size.height * .33,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage(ui["thumbnail"]),
                        fit: BoxFit.cover,
                      ),
                      // color: Colors.red,
                    ),
                  ),
                ),
                Hero(
                  tag: 'ui-name',
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              ui["name"],
                              style: TextStyle(
                                fontSize: 24.0,
                              ),
                            ),
                            Text(
                              "By ${ui["designer"]}",
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed(ui["miniApp"]),
                  child: Text("Open App"),
                )
              ],
            ),
          ),
          Positioned(
            child: Container(
              padding: EdgeInsets.only(
                left: 8.0,
                bottom: 8.0,
                top: MediaQuery.of(context).padding.top,
              ),
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)),
              child: Row(
                children: <Widget>[
                  BackButton(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

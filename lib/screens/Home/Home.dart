import 'package:flutter/material.dart';

import 'package:flutter_uis/UI.dart';

class HomeScreen extends StatelessWidget {
  final list = [
    {"label": "Explore UI", "path": 'uiList', "icon": Icons.explore},
    {"label": "Settings", "path": "settings", "icon": Icons.settings},
    {"label": "about", "path": "about", "icon": Icons.ac_unit}
  ];

  @override
  Widget build(BuildContext context) {
    UI.init(context);

    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top * 2.5,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              colors: [
                Colors.red,
                Colors.purple,
              ],
            ),
          ),
          child: SizedBox.expand(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(8.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Text(
                    "Welcome to Flutter UIs build by @hackerhgl",
                    textAlign: TextAlign.center,
                  ),
                ),
                ...list
                    .map(
                      (item) => RaisedButton(
                        onPressed: () =>
                            Navigator.of(context).pushNamed(item["path"]),
                        child: Text(item["label"]),
                      ),
                    )
                    .toList()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

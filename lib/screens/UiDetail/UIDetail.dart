import 'package:flutter/material.dart';

import 'package:flutter_uis/blocs/ui_bloc/bloc.dart';

class UiDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UIItem uiItem = ModalRoute.of(context).settings.arguments;
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        return Container(
          child: Scaffold(
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
                              image: ExactAssetImage(uiItem.thumbnail),
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
                                    uiItem.name,
                                    style: TextStyle(
                                      fontSize: 24.0,
                                    ),
                                  ),
                                  Text(
                                    "By ${uiItem.designer}",
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
                        onPressed: () => Navigator.of(context).pushNamed(
                          uiItem.miniApp,
                        ),
                        child: Text("Open App"),
                      ),
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
                    decoration:
                        BoxDecoration(color: Colors.black.withOpacity(0.2)),
                    child: Row(
                      children: <Widget>[
                        BackButton(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;

import 'package:flutter_uis/io/io.dart';

void main() {
  if (Platform.isWindows || Platform.isLinux) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }

  runApp(MyFKNNNApp());
}

class MyFKNNNApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyFKNNNHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyFKNNNHomePage extends StatefulWidget {
  MyFKNNNHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyFKNNNHomePageState createState() => _MyFKNNNHomePageState();
}

class _MyFKNNNHomePageState extends State<MyFKNNNHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: Key("button"),
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

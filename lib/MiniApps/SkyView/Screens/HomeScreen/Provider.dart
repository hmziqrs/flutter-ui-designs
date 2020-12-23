import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class SKVHomeState extends ChangeNotifier {
  static SKVHomeState state(BuildContext context, [listen = false]) =>
      Provider.of<SKVHomeState>(context, listen: listen);

  double _offsetX = 0.0;
  double _previousOffsetX = 0.0;
  double get offsetX => this._offsetX;
  setOffsetX(double pixels) {
    this._offsetX = pixels - this._previousOffsetX;
    this._previousOffsetX = pixels;
    this.notifyListeners();
  }

  double _offsetY = 0.0;
  double _previousOffsetY = 0.0;
  double get offsetY => this._offsetY;
  setOffsetY(double pixels) {
    this._offsetY = pixels - this._previousOffsetY;
    this._previousOffsetY = pixels;
    this.notifyListeners();
  }
}

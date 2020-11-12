import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ASCShoeProvider extends ChangeNotifier {
  static ASCShoeProvider state(BuildContext context, [listen = false]) =>
      Provider.of<ASCShoeProvider>(context, listen: listen);
  static final List<int> shoeSizes = [7, 8, 9, 10, 11];

  int _activeShoeSize = shoeSizes[0];
  AnimationController shoesController;
  Animation<double> shoeAnimation;
  int _index = 0;
  get activeShoeSize => this._activeShoeSize;

  void setShoeSize(size, int index) {
    if (this._index == index) {
      return;
    }
    this._activeShoeSize = size;
    this.notifyListeners();
    const SCALE_FACTOR = 0.07;
    this.shoeAnimation = Tween(
      begin: SCALE_FACTOR * (this._index),
      end: SCALE_FACTOR * (index),
    ).animate(
      CurvedAnimation(
        curve: Curves.elasticOut,
        parent: shoesController,
      ),
    );
    this.shoesController.forward(from: 0.0);
    this._index = index;
  }
}

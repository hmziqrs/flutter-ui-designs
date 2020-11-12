import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ASCShoeProvider extends ChangeNotifier {
  static ASCShoeProvider state(BuildContext context, [listen = false]) =>
      Provider.of<ASCShoeProvider>(context, listen: listen);
  static final List<int> shoeSizes = [7, 8, 9, 10, 11];

  int _activeShoeSize = shoeSizes[0];
  get activeShoeSize => this._activeShoeSize;

  void setShoeSize(size) {
    this._activeShoeSize = size;
    this.notifyListeners();
  }
}

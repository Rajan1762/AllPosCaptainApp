import 'package:flutter/material.dart';

class BottomProvider extends ChangeNotifier{
  int _bottomIndex = 0;

  int get bottomIndex => _bottomIndex;

  set bottomIndex(int value) {
    _bottomIndex = value;
    notifyListeners();
  }

}

import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increament() {
    _count = _count + 1;
    notifyListeners();
  }

  void decreament() {
    if (_count == 0) return;
    _count = _count - 1;
    notifyListeners();
  }
}

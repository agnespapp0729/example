import 'package:flutter/cupertino.dart';

class MyCounter with ChangeNotifier {
  int _counter = 0;

  getCounter() => _counter;
  setCounter(int counter) => _counter = counter;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void decrementCounter() {
    _counter++;
    notifyListeners();
  }
}

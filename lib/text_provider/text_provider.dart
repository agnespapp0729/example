import 'package:flutter/widgets.dart';

class TextProvider with ChangeNotifier {
  String name = "";

  String get getName => name;
  saveName(String name1) {
    name = name1;
    notifyListeners();
  }
}

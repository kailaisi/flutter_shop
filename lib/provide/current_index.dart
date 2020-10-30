import 'package:flutter/material.dart';

class CurrentIndexProvide extends ChangeNotifier {
  int index = 0;

  changeIndex(newIndex) {
    index = newIndex;
    notifyListeners();
  }
}

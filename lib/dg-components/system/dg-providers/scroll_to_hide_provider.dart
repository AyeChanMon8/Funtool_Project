import 'package:flutter/material.dart';

class ScrollToHideProvider with ChangeNotifier {
  bool isVisible = true;

  hide() {
    isVisible = false;
    notifyListeners();
  }

  show() {
    isVisible = true;
    notifyListeners();
  }
//notifyListeners(); -- for state change
}

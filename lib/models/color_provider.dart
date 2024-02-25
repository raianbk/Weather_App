import 'package:api_tests/const/consts.dart';
import 'package:flutter/material.dart';

class ColorProvider extends ChangeNotifier {
  Color? changeColor;

  ColorProvider();

  void toWhite() {
    changeColor = Colors.white;
    notifyListeners();
  }

  void toTurq() {
    changeColor = turq;
    notifyListeners();
  }
}

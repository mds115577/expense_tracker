import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  int isSelected = 0;
  final sortList = ["Today", "Weekly", "Monthly"];

  sortData(int value) {
    isSelected = value;
    notifyListeners();
  }
}

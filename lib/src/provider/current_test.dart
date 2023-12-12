import 'package:flutter/material.dart';

class CurrentTest with ChangeNotifier {
  String? _selectedAnswer;
  bool? _result;
  int _index = 0;

  String? get selectedAnswer => _selectedAnswer;
  bool? get result => _result;
  int get index => _index;

  void updateAnswerSelected(String answer) {
    _selectedAnswer = answer;
    notifyListeners();
  }

  void updateResult(bool? result) {
    _result = result;
    notifyListeners();
  }

  void updateIndex(int index) {
    _index = index;
    notifyListeners();
  }
}

import 'package:bahasaku/src/models/question_model.dart';
import 'package:flutter/material.dart';

class CurrentTest with ChangeNotifier {
  Answer? _selectedAnswer;
  bool? _result;
  int _index = 0;

  Answer? get selectedAnswer => _selectedAnswer;
  bool? get result => _result;
  int get index => _index;

  void updateAnswerSelected(Answer answer) {
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

import 'dart:convert';
import 'package:bahasaku/src/models/question_model.dart';
import 'package:flutter/services.dart';

class DataRequest {
  static Future<List<Question>> fetchQuestion() async {
    final String rawData = await rootBundle.loadString('assets/fakedata.json');
    final JsonDecoder decoder = new JsonDecoder();
    final questionContainer = decoder.convert(rawData);
    final List questionList = questionContainer['questions'];
    return questionList.map((raw) => Question.fromJson(raw)).toList();
  }
}

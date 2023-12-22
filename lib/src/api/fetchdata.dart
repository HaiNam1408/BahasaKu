import 'dart:convert';

import 'package:bahasaku/src/models/course_model.dart';
import 'package:bahasaku/src/models/question_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class DataRequest {
  static Future<List<Question>> fetchQuestion() async {
    final String rawData = await rootBundle.loadString('assets/fakedata.json');
    final JsonDecoder decoder = new JsonDecoder();
    final questionContainer = decoder.convert(rawData);
    final List questionList = questionContainer['questions'];
    return questionList.map((raw) => Question.fromJson(raw)).toList();
  }

  static Future<List<Course>> fetchCourses() async {
    CollectionReference courses =
        FirebaseFirestore.instance.collection('courses');

    List courseList = [];

    await courses.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        courseList.add(doc.data());
      });
    });
    List<Course> result =
        courseList.map((raw) => Course.fromJson(raw)).toList();
    return result;
  }

  static Future<Course> fetchCourseById(String id) async {
    CollectionReference courses =
        FirebaseFirestore.instance.collection('courses');

    QuerySnapshot querySnapshot =
        await courses.where('id', isEqualTo: id).get();
    if (querySnapshot.docs.isEmpty) {
      throw Exception('No course found with the given id');
    }

    DocumentSnapshot doc = querySnapshot.docs.first;
    return Course.fromJson(doc.data() as Map<String, dynamic>);
  }
}

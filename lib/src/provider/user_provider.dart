import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String? _name;
  int? _age;
  String? _email;
  String? _password;
  List _courses = [
    {"id": "course001", "progress": 0},
    {"id": "course002", "progress": 0},
    {"id": "course003", "progress": 0}
  ];

  String? get name => _name;
  int? get age => _age;
  String? get email => _email;
  String? get password => _password;
  List get courses => _courses;

  void checkData() {
    print(_age);
  }

  void updateName(String name) {
    _name = name;
    notifyListeners();
  }

  void updateAge(int age) {
    _age = age;
    notifyListeners();
  }

  void updateEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void updatePassword(String password) {
    _password = password;
    notifyListeners();
  }

  void updateCourses(List courses) {
    _courses = courses;
    notifyListeners();
  }

  Object getCurrentUser() {
    Object currentUser = {
      'uid': FirebaseAuth.instance.currentUser!.uid,
      'name': name,
      'age': age,
      'email': email,
      'password': password,
      'courses': courses
    };
    return currentUser;
  }
}

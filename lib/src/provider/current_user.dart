import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CurrentUser with ChangeNotifier {
  String? _name;
  int? _age;
  String? _email;
  String? _password;

  String? get name => _name;
  int? get age => _age;
  String? get email => _email;
  String? get password => _password;

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

  void addNewUser() {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    users
        .where('email', isEqualTo: email)
        .limit(1)
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.docs.isEmpty) {
        users.add(
            {'name': name, 'age': age, 'email': email, 'password': password});
      }
    });
  }
}

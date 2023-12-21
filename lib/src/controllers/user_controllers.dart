import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserController {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  createUser() async {
    users
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
        .limit(1)
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.docs.isEmpty) {
        users.add({
          'uid': FirebaseAuth.instance.currentUser?.uid,
          'name': FirebaseAuth.instance.currentUser!.displayName,
          'avatar': FirebaseAuth.instance.currentUser!.photoURL,
          'email': FirebaseAuth.instance.currentUser!.email
        });
      }
    });
  }

  updateUser(id, newdata) async {
    users
        .doc(id)
        .update(newdata)
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  deleteUser(id) async {
    users
        .doc(id)
        .delete()
        .then((value) => print("User deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }
}

import 'package:bahasaku/src/controllers/user_controllers.dart';
import 'package:bahasaku/src/provider/user_provider.dart';
import 'package:bahasaku/src/views/home_page/home_page.dart';
import 'package:bahasaku/src/views/start_screen/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class FirebaseServices {
  final _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();

  signInWithGoogle(context) async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken);
        await _auth.signInWithCredential(authCredential);
        Object userData = {
          'uid': FirebaseAuth.instance.currentUser?.uid,
          'name': FirebaseAuth.instance.currentUser!.displayName,
          'avatar': FirebaseAuth.instance.currentUser!.photoURL,
          'email': FirebaseAuth.instance.currentUser!.email,
          'courses': [
            {
              "id": "course001",
              "progress": [4, 1, 0, 0, 9, 0, 4, 0, 0, 0]
            },
            {
              "id": "course002",
              "progress": [3, 5, 0, 0, 3, 0, 2, 0, 0, 0]
            },
            {
              "id": "course003",
              "progress": [6, 0, 6, 0, 0, 4, 0, 0, 0, 0]
            }
          ]
        };
        await UserController().createUser(userData);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
          if (FirebaseAuth.instance.currentUser == null) {
            return const LoginPage();
          } else {
            return const HomePage();
          }
        }));
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      rethrow;
    }
  }

  static signUpUserByEmailPassword(
      String email, String password, String name, BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      Object userData =
          Provider.of<UserProvider>(context, listen: false).getCurrentUser();
      await UserController().createUser(userData);
      await FirebaseAuth.instance.currentUser!.updateDisplayName(name);
      await FirebaseAuth.instance.currentUser!.updateEmail(email);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Registration Successful')));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Password Provided is too weak')));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Email Provided already Exists')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  static signInUserByEmailPassword(
      String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('You are Logged in')));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
        if (FirebaseAuth.instance.currentUser == null) {
          return const LoginPage();
        } else {
          return const HomePage();
        }
      }));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('No user Found with this Email')));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Password did not match')));
      }
    }
  }

  googleSignOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }

  static uploadCourse() async {
    var course = {
      "id": "course005",
      "title": "TOEIC Grammar 2",
      "subtitle": "TOEIC part 2 grammar ",
      "image":
          "https://res.cloudinary.com/dmihbixsr/image/upload/v1703087011/Bahasaku/national-flag-of-uk-the-united-kingdom-of-great-britain-and-no-1587109450h7E_i9ace8.jpg",
      "cover_image": [
        "https://res.cloudinary.com/dmihbixsr/image/upload/v1703087122/Bahasaku/wallpapersden.com_london-england-city_1920x1080_woyuln.jpg",
        "https://res.cloudinary.com/dmihbixsr/image/upload/v1703087120/Bahasaku/th_owun1s.jpg",
        "https://res.cloudinary.com/dmihbixsr/image/upload/v1703087119/Bahasaku/th_1_dc0zfa.jpg"
      ],
      "description":
          "The English language is one of the most popular languages in the world. Learning English opens many doors for individuals, from global communication to exploring diverse knowledge and cultures.",
      "participants": "120",
      "content": [
        {
          "lesson": "1",
          "title": "Relative clauses",
          "estimate": "1 Hour 30 minutes",
          "set_of_question": ["question041"]
        },
        {
          "lesson": "2",
          "title": "conditional sentences 1",
          "estimate": "1 Hour 20 minutes",
          "set_of_question": ["question042"]
        },
        {
          "lesson": "3",
          "title": "conditional sentences 2",
          "estimate": "1 Hour 20 minutes",
          "set_of_question": ["question043"]
        },
        {
          "lesson": "4",
          "title": "conditional sentences 3",
          "estimate": "1 Hour 20 minutes",
          "set_of_question": ["question044"]
        }
      ]
    };

    CollectionReference courses =
        FirebaseFirestore.instance.collection('courses');

    courses
        .add(course)
        .then((value) => print("Course Added"))
        .catchError((error) => print("Failed to add course: $error"));
  }
}

import 'dart:async';
import 'package:bahasaku/src/utils/TColors.dart';
import 'package:bahasaku/src/views/home_page/home_page.dart';
import 'package:bahasaku/src/views/start_screen/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 2500), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) {
          if (FirebaseAuth.instance.currentUser == null) {
            return const LoginPage();
          } else {
            return const HomePage();
          }
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: TColors.primaryColor,
      body: Center(
          child: Image(
        width: 200,
        fit: BoxFit.contain,
        image: AssetImage('assets/images/LogoSplash.png'),
      )),
    );
  }
}

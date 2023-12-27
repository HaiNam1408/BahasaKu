import 'package:bahasaku/src/utils/TColors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LearnBanner extends StatelessWidget {
  const LearnBanner({super.key});

  @override
  Widget build(BuildContext context) {
    String? userName =
        FirebaseAuth.instance.currentUser?.displayName?.split(' ')[0];
    return Container(
      padding: const EdgeInsets.fromLTRB(32, 60, 0, 0),
      decoration: const BoxDecoration(color: TColors.primaryColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Text(
                'Hi, $userName!',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),
              const Text(
                'What local language\nwould you like to learn?',
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
            ],
          ),
          Container(
            width: 156,
            height: 156,
            child: const Image(
              image: AssetImage('assets/images/IlustrationHomePage.png'),
              fit: BoxFit.fill,
            ),
          )
        ],
      ),
    );
  }
}

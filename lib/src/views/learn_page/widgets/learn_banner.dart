import 'package:bahasaku/src/utils/TColors.dart';
import 'package:flutter/material.dart';

class LearnBanner extends StatelessWidget {
  const LearnBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(32, 60, 0, 0),
      decoration: const BoxDecoration(color: TColors.primaryColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Text(
                'Hi, Nam!',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 16),
              Text(
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

import 'package:bahasaku/src/Theme/TColors.dart';
import 'package:flutter/material.dart';

class LearnNowButton extends StatelessWidget {
  const LearnNowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 100),
        height: 60,
        decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x26000000),
                blurRadius: 24,
                offset: Offset(0, 8),
                spreadRadius: 0,
              )
            ]),
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50))),
              backgroundColor: MaterialStateProperty.all(TColors.primaryColor)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('Learn Now', style: TextStyle(fontSize: 16)),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color(0xFF6FC6FF)),
                child: Icon(Icons.chevron_right),
              )
            ],
          ),
        ));
  }
}

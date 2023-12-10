import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AchievementStart extends StatelessWidget {
  final int star;
  const AchievementStart({super.key, required this.star});

  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(
      5,
      (index) {
        if (index < star.floor()) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 2),
            child: const Icon(
              CupertinoIcons.star_fill,
              size: 18,
              color: Color(0xffFF8504),
            ),
          );
        } else {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 2),
            child: const Icon(
              CupertinoIcons.star,
              size: 18,
              color: Colors.white,
            ),
          );
        }
      },
    ));
  }
}

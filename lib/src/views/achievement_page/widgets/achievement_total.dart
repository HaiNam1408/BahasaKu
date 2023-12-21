import 'package:bahasaku/src/common_widgets/circle_indicator.dart';
import 'package:flutter/material.dart';

class AchievementTotal extends StatelessWidget {
  final int achievement;
  const AchievementTotal({super.key, required this.achievement});

  @override
  Widget build(BuildContext context) {
    int totalAchievement = 20;
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: const BorderRadius.all(Radius.circular(4))),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            CircleIndicator(percent: achievement / totalAchievement),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Achivements: $totalAchievement',
                  style: const TextStyle(
                      fontSize: 16,
                      letterSpacing: -1,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const SizedBox(
                  width: 200,
                  child: Text(
                    'Great job, Nam! Complete your achievements now',
                    softWrap: true,
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

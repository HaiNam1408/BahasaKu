import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

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
            CircularPercentIndicator(
              radius: 45,
              lineWidth: 10,
              percent: achievement / totalAchievement,
              center: Text(
                '${(achievement / totalAchievement * 100).toInt()}%',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              progressColor: const Color(0xff69B85E),
              backgroundColor: const Color(0xffF2F2F7),
              circularStrokeCap: CircularStrokeCap.round,
            ),
            const SizedBox(
              width: 10,
            ),
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
                SizedBox(
                  height: 8,
                ),
                SizedBox(
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

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircleIndicator extends StatelessWidget {
  final double percent;
  final double? radius;
  final double? lineWidth;
  final double? fontSize;
  const CircleIndicator(
      {super.key,
      required this.percent,
      this.lineWidth = 10,
      this.fontSize = 18,
      this.radius = 45});

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      animation: true,
      animationDuration: 800,
      radius: radius!,
      lineWidth: lineWidth!,
      percent: percent,
      center: Text(
        '${(percent * 100).toInt()}%',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize),
      ),
      progressColor: const Color(0xff69B85E),
      backgroundColor: const Color(0xffF2F2F7),
      circularStrokeCap: CircularStrokeCap.round,
    );
  }
}

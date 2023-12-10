import 'package:bahasaku/src/Theme/tcolors.dart';
import 'package:bahasaku/src/utils/constant.dart';
import 'package:flutter/material.dart';

class StepProgress extends StatefulWidget {
  final int length;
  final int step;
  const StepProgress({super.key, required this.length, required this.step});

  @override
  State<StepProgress> createState() => _StepProgressState();
}

class _StepProgressState extends State<StepProgress> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.length, (index) {
        if (index < widget.step) {
          return Container(
            width: getWidth(context) * 0.5 / widget.length,
            height: 8,
            margin: const EdgeInsets.symmetric(horizontal: 1.5),
            decoration: BoxDecoration(
                color: TColors.primaryColor,
                borderRadius: BorderRadius.circular(10)),
          );
        } else {
          return Container(
            width: getWidth(context) * 0.5 / widget.length,
            height: 8,
            margin: const EdgeInsets.symmetric(horizontal: 2),
            decoration: BoxDecoration(
                color: TColors.grayColor,
                borderRadius: BorderRadius.circular(10)),
          );
        }
      }),
    );
  }
}

import 'package:bahasaku/src/Theme/TColors.dart';
import 'package:flutter/material.dart';

class CheckCircle extends StatelessWidget {
  final bool isCorrect;
  const CheckCircle({super.key, required this.isCorrect});

  @override
  Widget build(BuildContext context) {
    Map<String, List> prototype = {
      'color': [TColors.successColor, TColors.dangerColor],
      'bgcolor': [TColors.bgSuccessColor, TColors.bgDangerColor],
      'icon': [Icons.check_rounded, Icons.clear],
    };
    int index = isCorrect ? 0 : 1;
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
          color: prototype['bgcolor']![index],
          borderRadius: BorderRadius.circular(50),
          border: Border.all(width: 2.4, color: prototype['color']![index])),
      child: Icon(
        prototype['icon']![index],
        color: prototype['color']![index],
      ),
    );
  }
}

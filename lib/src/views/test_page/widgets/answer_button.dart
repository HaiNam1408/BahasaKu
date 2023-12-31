import 'package:bahasaku/src/utils/TColors.dart';
import 'package:bahasaku/src/provider/test_provider.dart';
import 'package:bahasaku/src/utils/play_sound.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnswerButton extends StatefulWidget {
  final String choice;
  final String answer;
  final bool isSelected;
  const AnswerButton(
      {super.key,
      required this.choice,
      required this.answer,
      required this.isSelected});

  @override
  State<AnswerButton> createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          shadows: [
            BoxShadow(
              color: widget.isSelected ? Color(0x66AD7000) : Color(0x660068AD),
              blurRadius: 1,
              offset: const Offset(2, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: ElevatedButton(
          onPressed: () async {
            bool isCorrect = widget.answer == widget.choice;
            Provider.of<TestProvider>(context, listen: false)
                .updateAnswerSelected(widget.choice);
            Provider.of<TestProvider>(context, listen: false)
                .updateResult(isCorrect);
            // Play sound
            if (isCorrect) {
              PlaySound.correctAnswer();
            } else {
              PlaySound.wrongAnswer();
            }
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(8),
            primary: widget.isSelected
                ? (widget.choice == widget.answer
                    ? TColors.successColor
                    : TColors.dangerColor)
                : TColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            widget.choice,
            style: const TextStyle(color: Colors.white),
          ),
        ));
  }
}

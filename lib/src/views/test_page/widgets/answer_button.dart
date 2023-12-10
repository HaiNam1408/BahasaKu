import 'package:bahasaku/src/Theme/TColors.dart';
import 'package:bahasaku/src/models/question_model.dart';
import 'package:bahasaku/src/provider/current_question.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnswerButton extends StatefulWidget {
  final Answer answer;
  final bool isSelected;
  const AnswerButton(
      {super.key, required this.answer, required this.isSelected});

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
          onPressed: () {
            Provider.of<CurrentTest>(context, listen: false)
                .updateAnswerSelected(widget.answer);
            bool isCorrect = Provider.of<CurrentTest>(context, listen: false)
                .selectedAnswer!
                .isCorrect;
            Provider.of<CurrentTest>(context, listen: false)
                .updateResult(isCorrect);
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(8),
            primary: widget.isSelected
                ? (Provider.of<CurrentTest>(context, listen: false)
                        .selectedAnswer!
                        .isCorrect
                    ? TColors.successColor
                    : TColors.dangerColor)
                : TColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            widget.answer.answerText,
            style: const TextStyle(color: Colors.white),
          ),
        ));
  }
}

import 'package:bahasaku/src/Theme/TColors.dart';
import 'package:bahasaku/src/models/question_model.dart';
import 'package:bahasaku/src/provider/current_question.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NextButton extends StatefulWidget {
  final Question question;
  final bool isCorrect;
  final Function onTap;
  const NextButton(
      {super.key,
      required this.question,
      required this.isCorrect,
      required this.onTap});

  @override
  State<NextButton> createState() => _NextButtonState();
}

class _NextButtonState extends State<NextButton> {
  @override
  Widget build(BuildContext context) {
    Color statusColor =
        widget.isCorrect ? TColors.successColor : TColors.dangerColor;
    return Container(
      decoration: BoxDecoration(
          color:
              widget.isCorrect ? TColors.bgSuccessColor : TColors.bgDangerColor,
          borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.fromLTRB(24, 14, 24, 10),
      margin: const EdgeInsets.fromLTRB(22, 0, 22, 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Amazing!',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: statusColor)),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Answer: ',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: statusColor),
              ),
              Text(
                widget.question.answersList
                    .where((answer) => answer.isCorrect == true)
                    .first
                    .answerText,
                style: TextStyle(fontSize: 13, color: statusColor),
              )
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.maxFinite,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(statusColor),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50))),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 16))),
              onPressed: () {
                Provider.of<CurrentTest>(context, listen: false)
                    .updateResult(null);
                widget.onTap();
              },
              child: Text('Next Question'),
            ),
          ),
        ],
      ),
    );
  }
}

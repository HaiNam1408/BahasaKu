import 'package:bahasaku/src/Theme/TColors.dart';
import 'package:bahasaku/src/models/question_model.dart';
import 'package:bahasaku/src/provider/current_test.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NextButton extends StatefulWidget {
  final Question question;
  final Function onTap;
  const NextButton({super.key, required this.question, required this.onTap});

  @override
  State<NextButton> createState() => _NextButtonState();
}

class _NextButtonState extends State<NextButton> {
  @override
  Widget build(BuildContext context) {
    bool isCorrect = Provider.of<CurrentTest>(context).result!;
    Color statusColor = isCorrect ? TColors.successColor : TColors.dangerColor;
    return Container(
      decoration: BoxDecoration(
          color: isCorrect ? TColors.bgSuccessColor : TColors.bgDangerColor,
          borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.fromLTRB(24, 14, 24, 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(isCorrect ? 'Amazing!' : 'Ups.. That’s wrong!',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: statusColor)),
          const SizedBox(height: 12),
          Text(
            'Answer: ',
            style: TextStyle(
                fontSize: 17, fontWeight: FontWeight.w500, color: statusColor),
          ),
          Flexible(
            child: Text(
              widget.question.answer!,
              softWrap: true,
              maxLines: 5,
              style: TextStyle(fontSize: 13, color: statusColor),
            ),
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

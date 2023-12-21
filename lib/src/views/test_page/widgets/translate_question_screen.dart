import 'package:bahasaku/src/utils/TColors.dart';
import 'package:bahasaku/src/models/question_model.dart';
import 'package:bahasaku/src/provider/current_test.dart';
import 'package:bahasaku/src/utils/constant.dart';
import 'package:bahasaku/src/utils/play_sound.dart';
import 'package:bahasaku/src/views/test_page/widgets/check_button.dart';
import 'package:bahasaku/src/views/test_page/widgets/check_circle.dart';
import 'package:bahasaku/src/views/test_page/widgets/next_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:provider/provider.dart';

class TranslateQuestion extends StatefulWidget {
  final Question question;
  final Function onTap;
  const TranslateQuestion(
      {super.key, required this.question, required this.onTap});

  @override
  State<TranslateQuestion> createState() => _TranslateQuestionState();
}

class _TranslateQuestionState extends State<TranslateQuestion> {
  final FlutterTts tts = FlutterTts();
  TextEditingController textarea = TextEditingController();
  void speak(String text) async {
    await tts.setLanguage('en-US');
    await tts.speak(text);
  }

  var textValue = '';
  bool? isCorrect;
  void checkAnswer() {
    if (textValue != '') {
      String answer = widget.question.answer!;
      bool isCorrect =
          textValue.trim().toLowerCase() == answer.trim().toLowerCase();
      Provider.of<CurrentTest>(context, listen: false).updateResult(isCorrect);
      // Play sound
      if (isCorrect) {
        PlaySound.correctAnswer();
      } else {
        PlaySound.wrongAnswer();
      }
    }
  }

  @override
  void dispose() {
    textarea.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    isCorrect = Provider.of<CurrentTest>(context).result;
    return Stack(
      children: [
        SizedBox(
          height: getHeight(context) - 130,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(widget.question.title!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 36),
              Row(
                children: [
                  SizedBox(
                    height: 50,
                    width: 60,
                    child: ElevatedButton(
                        onPressed: () {
                          speak(widget.question.sentence ?? '');
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(TColors.primaryColor),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)))),
                        child: const Icon(CupertinoIcons.speaker_2,
                            color: Colors.white)),
                  ),
                  const SizedBox(width: 12),
                  Flexible(
                    child: Text(widget.question.sentence!,
                        style: const TextStyle(
                            letterSpacing: -0.41, fontSize: 16)),
                  )
                ],
              ),
              const SizedBox(height: 32),
              SizedBox(
                height: 220,
                child: IgnorePointer(
                    ignoring: Provider.of<CurrentTest>(context).result == null
                        ? false
                        : true,
                    child: Stack(children: [
                      TextField(
                        onChanged: (value) {
                          textValue = value;
                        },
                        controller: textarea,
                        keyboardType: TextInputType.multiline,
                        maxLines: 8,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFFF7F7F7),
                          hintText: 'Type your answer',
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(18)),
                              borderSide: BorderSide(
                                  width: 1,
                                  color: isCorrect == null
                                      ? const Color(0xFFC5BFBF)
                                      : isCorrect!
                                          ? TColors.successColor
                                          : TColors.dangerColor)),
                          focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18)),
                              borderSide: BorderSide(
                                  width: 1, color: Color(0xFFC5BFBF))),
                        ),
                      ),
                      isCorrect == null
                          ? const SizedBox()
                          : Positioned(
                              bottom: 14,
                              right: 14,
                              child: CheckCircle(isCorrect: isCorrect!))
                    ])),
              )
            ],
          ),
        ),
        Positioned(
            bottom: 4,
            left: 0,
            right: 0,
            child: Provider.of<CurrentTest>(context).result == null
                ? CheckButton(onTap: checkAnswer)
                : NextButton(
                    question: widget.question,
                    onTap: () {
                      widget.onTap();
                      textarea.clear();
                    }))
      ],
    );
  }
}

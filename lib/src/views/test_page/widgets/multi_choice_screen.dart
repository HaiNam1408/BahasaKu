import 'package:bahasaku/src/models/question_model.dart';
import 'package:bahasaku/src/provider/current_test.dart';
import 'package:bahasaku/src/utils/constant.dart';
import 'package:bahasaku/src/views/test_page/widgets/answer_button.dart';
import 'package:bahasaku/src/views/test_page/widgets/next_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MultiChoiceScreen extends StatefulWidget {
  final Question question;
  final Function onTap;
  const MultiChoiceScreen(
      {super.key, required this.question, required this.onTap});

  @override
  State<MultiChoiceScreen> createState() => _MultiChoiceScreenState();
}

class _MultiChoiceScreenState extends State<MultiChoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: getHeight(context) - 130,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 326,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.question.title!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 20)),
                    const SizedBox(height: 36),
                    widget.question.image == null
                        ? const SizedBox()
                        : Image(
                            image: AssetImage(widget.question.image!),
                            width: getWidth(context) * 0.45,
                            fit: BoxFit.fill,
                          ),
                  ],
                ),
              ),
              Container(
                height: 180,
                child: IgnorePointer(
                  ignoring: Provider.of<CurrentTest>(context).result == null
                      ? false
                      : true,
                  child: CustomScrollView(
                    slivers: [
                      SliverGrid(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 30,
                          crossAxisSpacing: 53,
                          childAspectRatio: 2,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return AnswerButton(
                                choice: widget.question.choices![index],
                                answer: widget.question.answer!,
                                isSelected: widget.question.choices![index] ==
                                    Provider.of<CurrentTest>(context)
                                        .selectedAnswer);
                          },
                          childCount: 4,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
            bottom: 4,
            left: 0,
            right: 0,
            child: Provider.of<CurrentTest>(context).result == null
                ? const SizedBox()
                : NextButton(question: widget.question, onTap: widget.onTap))
      ],
    );
  }
}

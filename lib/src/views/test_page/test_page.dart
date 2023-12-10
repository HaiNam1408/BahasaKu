import 'package:bahasaku/src/common_widgets/prev_button.dart';
import 'package:bahasaku/src/models/question_model.dart';
import 'package:bahasaku/src/provider/current_question.dart';
import 'package:bahasaku/src/views/test_page/widgets/multi_choice_screen.dart';
import 'package:bahasaku/src/views/test_page/widgets/next_button.dart';
import 'package:bahasaku/src/views/test_page/widgets/step_progress.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final listQuestion = getQuestions();
  late int index;
  @override
  void initState() {
    index = 0;
  }

  void updateIndex() {
    setState(() {
      if (index < listQuestion.length - 1) {
        index = index + 1;
      } else {
        index = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = listQuestion[index];
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          leadingWidth: 66,
          toolbarHeight: 66,
          leading: const PrevButton(),
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(22, 62, 22, 12),
          child: Column(
            children: [
              StepProgress(length: listQuestion.length, step: index + 1),
              const SizedBox(height: 48),
              MultiChoiceScreen(question: currentQuestion),
            ],
          ),
        ),
        bottomNavigationBar: Provider.of<CurrentTest>(context).result == null
            ? null
            : NextButton(
                question: currentQuestion,
                isCorrect: Provider.of<CurrentTest>(context).result!,
                onTap: updateIndex));
  }
}

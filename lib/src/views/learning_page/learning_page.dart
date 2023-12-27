import 'package:bahasaku/src/utils/TColors.dart';
import 'package:bahasaku/src/common_widgets/action_button.dart';
import 'package:bahasaku/src/common_widgets/prev_button.dart';
import 'package:bahasaku/src/utils/constant.dart';
import 'package:bahasaku/src/views/learning_page/widgets/learn_now_button.dart';
import 'package:bahasaku/src/views/learning_page/widgets/level_card.dart';
import 'package:flutter/material.dart';

class LearningPage extends StatefulWidget {
  final String courseId;
  const LearningPage({super.key, required this.courseId});

  @override
  State<LearningPage> createState() => _LearningPageState();
}

class _LearningPageState extends State<LearningPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leadingWidth: 66,
        toolbarHeight: 66,
        leading: const PrevButton(),
        actions: const [ActionButton()],
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: const LearnNowButton(),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 56, 0, 12),
            width: 260,
            height: 260,
            child: const Image(
              image: AssetImage('assets/images/IlustrationLearning.png'),
            ),
          ),
          const Text(
            'Learn Sundanese',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: TColors.textColor,
              fontSize: 26,
            ),
          ),
          const SizedBox(height: 25),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 31),
            height: getHeight(context) - 504,
            child: ListView(
              padding: const EdgeInsets.all(0),
              physics: const BouncingScrollPhysics(),
              children: const [
                LevelCard(
                    title: 'Introduction',
                    estimateTime: '1 Hour 30 minutes',
                    level: 1,
                    numberOfLesson: 50,
                    numberOfFinished: 9),
                LevelCard(
                    title: 'Grammar',
                    estimateTime: '1 Hour 30 minutes',
                    level: 2,
                    numberOfLesson: 40,
                    numberOfFinished: 14),
                LevelCard(
                    title: 'Vocabulary',
                    estimateTime: '1 Hour 30 minutes',
                    level: 3,
                    numberOfLesson: 30,
                    numberOfFinished: 1),
              ],
            ),
          )
        ],
      ),
    );
  }
}

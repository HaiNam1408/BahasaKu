import 'package:bahasaku/src/models/course_model.dart';
import 'package:bahasaku/src/provider/user_provider.dart';
import 'package:bahasaku/src/utils/TColors.dart';
import 'package:bahasaku/src/common_widgets/action_button.dart';
import 'package:bahasaku/src/common_widgets/prev_button.dart';
import 'package:bahasaku/src/utils/constant.dart';
import 'package:bahasaku/src/views/learning_page/widgets/learn_now_button.dart';
import 'package:bahasaku/src/views/learning_page/widgets/level_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LearningPage extends StatefulWidget {
  final String courseId;
  final String title;
  const LearningPage({super.key, required this.courseId, required this.title});

  @override
  State<LearningPage> createState() => _LearningPageState();
}

class _LearningPageState extends State<LearningPage> {
  @override
  Widget build(BuildContext context) {
    List courseList = Provider.of<UserProvider>(context, listen: false).courses;
    List progress = courseList.where((e) {
      return e["id"] == widget.courseId;
    }).toList()[0]['progress'];
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
        scrolledUnderElevation: 0,
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
          Text(
            widget.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: TColors.textColor,
              fontSize: 26,
            ),
          ),
          const SizedBox(height: 25),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 31),
              height: getHeight(context) - 504,
              child: FutureBuilder<QuerySnapshot>(
                future: FirebaseFirestore.instance
                    .collection('courses')
                    .where('id', isEqualTo: widget.courseId)
                    .get(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Loading");
                  }
                  final data = snapshot.data!.docs;
                  List<Course> lessonList = data
                          ?.map((item) => Course.fromJson(
                              item.data() as Map<String, dynamic>))
                          .toList() ??
                      [];
                  return ListView(
                    padding: const EdgeInsets.all(0),
                    physics: const BouncingScrollPhysics(),
                    children:
                        lessonList[0].content!.asMap().entries.map((entry) {
                      int index = entry.key;
                      var lesson = entry.value;
                      return LessonCard(
                        title: lesson.title ?? '',
                        estimateTime: lesson.estimate ?? '',
                        level: lesson.lesson ?? '0',
                        numberOfLesson: lesson.setOfQuestion!.length * 10,
                        numberOfFinished: progress[index] ?? 0,
                      );
                    }).toList(),
                  );
                },
              ))
        ],
      ),
    );
  }
}

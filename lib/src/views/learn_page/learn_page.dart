import 'package:bahasaku/src/provider/user_provider.dart';
import 'package:bahasaku/src/utils/TColors.dart';
import 'package:bahasaku/src/utils/constant.dart';
import 'package:bahasaku/src/views/learn_page/widgets/cell_course.dart';
import 'package:bahasaku/src/views/learn_page/widgets/learn_banner.dart';
import 'package:bahasaku/src/views/learn_page/widgets/small_earning.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LearnPage extends StatefulWidget {
  const LearnPage({super.key});

  @override
  State<LearnPage> createState() => _HomeState();
}

class _HomeState extends State<LearnPage> {
  List<Widget> CellCourseList() {
    List courseList = Provider.of<UserProvider>(context, listen: false).courses;
    List<Widget> result = courseList.map((course) {
      return FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection('courses')
            .where('id', isEqualTo: course['id'])
            .get()
            .then((snapshot) => snapshot.docs.first),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return const Text('Something be wrong!');
          } else {
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              child: CellCourse(
                title: snapshot.data?['title'],
                image: snapshot.data?['image'],
                progress: course['progress'].toDouble(),
                courseId: course['id'],
              ),
            );
          }
        },
      );
    }).toList();
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const LearnBanner(),
        Positioned(
            top: 240,
            height: getHeight(context) - 292,
            width: getWidth(context),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(
                children: [
                  Container(
                    width: 70,
                    height: 4,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(38, 50, 56, 0.43),
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                  ),
                  Expanded(
                    flex: 1,
                    child: ListView(
                      children: [
                        const Text(
                          'Language Being Learned',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: TColors.textColor),
                        ),
                        const SizedBox(height: 30),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SmallEarningCard(
                                title: '7 level',
                                headtitle: 'Minangkabau',
                                subtitle: '7K participants'),
                            SmallEarningCard(
                                title: '5 level',
                                headtitle: 'Papua',
                                subtitle: '5K participants'),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Column(children: CellCourseList())
                      ],
                    ),
                  )
                ],
              ),
            ))
      ],
    );
  }
}

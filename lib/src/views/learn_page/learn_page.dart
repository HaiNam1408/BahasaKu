import 'package:bahasaku/src/Theme/TColors.dart';
import 'package:bahasaku/src/utils/constant.dart';
import 'package:bahasaku/src/views/learn_page/widgets/cell_course.dart';
import 'package:bahasaku/src/views/learn_page/widgets/learn_banner.dart';
import 'package:bahasaku/src/views/learn_page/widgets/small_earning.dart';
import 'package:flutter/material.dart';

class LearnPage extends StatefulWidget {
  const LearnPage({super.key});

  @override
  State<LearnPage> createState() => _HomeState();
}

class _HomeState extends State<LearnPage> {
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
                      children: const [
                        Text(
                          'Language Being Learned',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: TColors.textColor),
                        ),
                        SizedBox(height: 30),
                        Row(
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
                        SizedBox(height: 30),
                        Column(
                          children: [
                            CellCourse(
                                title: 'Sundanese',
                                image: 'assets/images/image1.png',
                                progress: 80),
                            SizedBox(height: 12),
                            CellCourse(
                                title: 'Balinese',
                                image: 'assets/images/image2.png',
                                progress: 50),
                            SizedBox(height: 12),
                            CellCourse(
                                title: 'Aceh',
                                image: 'assets/images/image3.png',
                                progress: 30),
                            SizedBox(height: 12)
                          ],
                        )
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

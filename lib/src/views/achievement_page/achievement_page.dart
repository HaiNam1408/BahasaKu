import 'package:bahasaku/src/common_widgets/action_button.dart';
import 'package:bahasaku/src/views/achievement_page/widgets/achievement_card.dart';
import 'package:bahasaku/src/views/achievement_page/widgets/achievement_total.dart';
import 'package:flutter/material.dart';

class AchievementPage extends StatelessWidget {
  const AchievementPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Color> colors = [
      const Color(0xff9BD2FC),
      const Color(0xffF1C40F),
      const Color(0xff16A085),
      const Color(0xff2980B9),
    ];
    final List<Map<String, dynamic>> achivements = [
      {
        'title': 'Studious',
        'subtitle': 'You have completed this lesson 10 times.',
        'image': 'assets/images/Group259.png',
        'star': 3
      },
      {
        'title': 'Quickie',
        'subtitle':
            'You have completed this quiz in less than 3 minutes, 10 times.',
        'image': 'assets/images/Group258.png',
        'star': 4,
      },
      {
        'title': 'Ambitious',
        'subtitle': 'You have achieved 15 milestones.',
        'image': 'assets/images/Group257.png',
        'star': 2,
      },
      {
        'title': 'Perfectionist',
        'subtitle': 'You have scored 100% on quizzes 20 times.',
        'image': 'assets/images/Group256.png',
        'star': 3
      },
    ];
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 66,
          title: const Text(
            'Achievement',
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          actions: const [ActionButton()],
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Positioned(
                  bottom: 0,
                  top: 140,
                  right: 20,
                  left: 20,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.only(top: 10),
                    children: [
                      SizedBox(
                        child: Column(
                          children: [
                            AchievementTotal(achievement: 16),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              children: List<Widget>.generate(
                                  achivements.length,
                                  (index) => Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 20),
                                        child: AchievementCard(
                                          title: achivements[index]['title'],
                                          subtitle: achivements[index]
                                              ['subtitle'],
                                          image: achivements[index]['image'],
                                          star: achivements[index]['star'],
                                          color: colors[index],
                                        ),
                                      )),
                            ),
                          ],
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ));
  }
}

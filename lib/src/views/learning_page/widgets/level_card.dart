import 'package:bahasaku/src/utils/TColors.dart';
import 'package:bahasaku/src/views/test_page/test_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LessonCard extends StatefulWidget {
  final String title;
  final String estimateTime;
  final String level;
  final int numberOfLesson;
  final int numberOfFinished;
  const LessonCard(
      {super.key,
      required this.title,
      required this.estimateTime,
      required this.level,
      required this.numberOfLesson,
      required this.numberOfFinished});

  @override
  State<LessonCard> createState() => _LessonCardState();
}

class _LessonCardState extends State<LessonCard> {
  final Map levels = {
    '1': {
      'icon': SvgPicture.asset('assets/icon/Handshake.svg'),
      'label': 'Lesson 1',
      'color': TColors.successColor
    },
    '2': {
      'icon': SvgPicture.asset('assets/icon/BookBookmark.svg'),
      'label': 'Lesson 2',
      'color': TColors.warningColor
    },
    '3': {
      'icon': SvgPicture.asset('assets/icon/Fire.svg'),
      'label': 'Lesson 3',
      'color': TColors.dangerColor
    },
    '4': {
      'icon': SvgPicture.asset('assets/icon/Handshake.svg'),
      'label': 'Lesson 4',
      'color': TColors.successColor
    },
    '5': {
      'icon': SvgPicture.asset('assets/icon/BookBookmark.svg'),
      'label': 'Lesson 5',
      'color': TColors.warningColor
    },
    '6': {
      'icon': SvgPicture.asset('assets/icon/Fire.svg'),
      'label': 'Lesson 6',
      'color': TColors.dangerColor
    },
    '7': {
      'icon': SvgPicture.asset('assets/icon/Handshake.svg'),
      'label': 'Lesson 7',
      'color': TColors.successColor
    },
    '8': {
      'icon': SvgPicture.asset('assets/icon/BookBookmark.svg'),
      'label': 'Lesson 8',
      'color': TColors.warningColor
    },
    '9': {
      'icon': SvgPicture.asset('assets/icon/Fire.svg'),
      'label': 'Lesson 9',
      'color': TColors.dangerColor
    },
    '10': {
      'icon': SvgPicture.asset('assets/icon/Handshake.svg'),
      'label': 'Lesson 10',
      'color': TColors.successColor
    }
  };

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const TestPage()));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 9),
        height: 84,
        padding: const EdgeInsets.only(top: 8, left: 12, right: 8, bottom: 8),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFFCDCDCD)),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 56,
              decoration: ShapeDecoration(
                color: levels[widget.level]['color'],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                shadows: [
                  BoxShadow(
                    color: levels[widget.level]['color'],
                    blurRadius: 0,
                    offset: const Offset(0, 2),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  levels[widget.level]['icon'],
                  Text(
                    levels[widget.level]['label'],
                    style: TextStyle(
                        color: Colors.white, fontSize: 9, letterSpacing: -0.5),
                  )
                ],
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                        fontSize: 18,
                        height: 1,
                        color: TColors.textColor,
                        letterSpacing: -0.2,
                        overflow: TextOverflow.ellipsis),
                  ),
                  Text(
                    widget.estimateTime,
                    style: const TextStyle(
                        fontSize: 10,
                        color: TColors.textColor,
                        letterSpacing: -0.2,
                        overflow: TextOverflow.ellipsis),
                  ),
                  Container(
                    height: 11,
                    child: LinearProgressIndicator(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      backgroundColor: Color(0xFFFFF5EE),
                      valueColor: AlwaysStoppedAnimation<Color>(
                          levels[widget.level]['color']),
                      value: widget.numberOfFinished / widget.numberOfLesson,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(width: 16),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                Text('${widget.numberOfFinished}/${widget.numberOfLesson}',
                    style: const TextStyle(fontSize: 12))
              ],
            )
          ],
        ),
      ),
    );
  }
}

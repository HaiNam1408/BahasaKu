import 'package:bahasaku/src/utils/TColors.dart';
import 'package:bahasaku/src/views/test_page/test_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LevelCard extends StatefulWidget {
  final String title;
  final String estimateTime;
  final int level;
  final int numberOfLesson;
  final int numberOfFinished;
  const LevelCard(
      {super.key,
      required this.title,
      required this.estimateTime,
      required this.level,
      required this.numberOfLesson,
      required this.numberOfFinished});

  @override
  State<LevelCard> createState() => _LevelCardState();
}

class _LevelCardState extends State<LevelCard> {
  final Map levels = {
    1: {
      'icon': SvgPicture.asset('assets/icon/Handshake.svg'),
      'label': 'Level 1',
      'color': TColors.successColor
    },
    2: {
      'icon': SvgPicture.asset('assets/icon/BookBookmark.svg'),
      'label': 'Level 2',
      'color': TColors.warningColor
    },
    3: {
      'icon': SvgPicture.asset('assets/icon/Fire.svg'),
      'label': 'Level 3',
      'color': TColors.dangerColor
    },
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
              width: 50,
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
                    style: TextStyle(color: Colors.white, fontSize: 9),
                  )
                ],
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style:
                        const TextStyle(fontSize: 18, color: TColors.textColor),
                  ),
                  SizedBox(height: 16),
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

import 'package:bahasaku/src/utils/tcolors.dart';
import 'package:bahasaku/src/views/learning_page/learning_page.dart';
import 'package:flutter/material.dart';

class CellCourse extends StatefulWidget {
  final String title;
  final String image;
  final double progress;
  final String courseId;
  const CellCourse(
      {super.key,
      required this.title,
      required this.image,
      this.progress = 0,
      required this.courseId});

  @override
  State<CellCourse> createState() => _CellCourseState();
}

class _CellCourseState extends State<CellCourse> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LearningPage(courseId: widget.courseId)));
      },
      child: Container(
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
              width: 56,
              height: 61,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.image),
                  fit: BoxFit.cover,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(37),
                ),
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
                    style: const TextStyle(
                        fontSize: 16,
                        color: TColors.textColor,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.2),
                  ),
                  SizedBox(height: 16),
                  Container(
                    height: 11,
                    child: LinearProgressIndicator(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      backgroundColor: Color(0xFFFFF5EE),
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                      value: widget.progress / 100,
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
                Text('${widget.progress.toInt()}%',
                    style: const TextStyle(fontSize: 12))
              ],
            )
          ],
        ),
      ),
    );
  }
}

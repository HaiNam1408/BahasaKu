import 'package:bahasaku/src/views/course_detail_page/course_detail_page.dart';
import 'package:flutter/material.dart';

class SearchCell extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final String courseId;
  const SearchCell(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.image,
      required this.courseId});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CourseDetailPage(courseId: courseId)));
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: const BorderRadius.all(Radius.circular(16))),
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(image),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                            fontSize: 16,
                            letterSpacing: -0.5,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        subtitle,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              const Icon(
                Icons.keyboard_arrow_right,
                size: 40,
                color: Colors.grey,
              )
            ],
          ),
        ),
      ),
    );
  }
}

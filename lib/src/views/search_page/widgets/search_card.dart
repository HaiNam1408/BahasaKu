import 'package:bahasaku/src/views/course_detail_page/course_detail_page.dart';
import 'package:flutter/material.dart';

class SearchCard extends StatelessWidget {
  final String title;
  final String image;
  const SearchCard({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const CourseDetailPage()));
      },
      child: SizedBox(
        width: 100,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image(
                image: NetworkImage(image),
                fit: BoxFit.cover,
                height: 88,
                width: 88,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}

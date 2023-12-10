import 'package:bahasaku/src/views/achievement_page/widgets/achievement_start.dart';
import 'package:flutter/material.dart';

class AchievementCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final int star;
  final Color color;
  const AchievementCard(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.image,
      this.star = 0,
      this.color = const Color(0xFF9BD2FC)});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 14, 0, 14),
              child: Row(
                children: [
                  Image(image: AssetImage(image)),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        width: 230,
                        child: Text(
                          subtitle,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(top: 10, right: 15, child: AchievementStart(star: star))
          ],
        ));
  }
}

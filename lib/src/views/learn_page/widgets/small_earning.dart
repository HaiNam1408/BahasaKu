import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SmallEarningCard extends StatefulWidget {
  final String title;
  final String headtitle;
  final String subtitle;
  const SmallEarningCard(
      {super.key,
      required this.title,
      required this.headtitle,
      required this.subtitle});

  @override
  State<SmallEarningCard> createState() => _SmallEarningCardState();
}

class _SmallEarningCardState extends State<SmallEarningCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(17, 12, 8, 13),
      height: 93,
      decoration: const BoxDecoration(
          color: Color(0xFF27AE60),
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.headtitle,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                widget.title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                widget.subtitle,
                style: const TextStyle(color: Colors.white, fontSize: 8),
              ),
            ],
          ),
          Container(
            width: 64,
            height: 64,
            child: IconButton(
                onPressed: null,
                icon: SvgPicture.asset(
                  'assets/icon/PlayButton.svg',
                )),
          )
        ],
      ),
    );
  }
}

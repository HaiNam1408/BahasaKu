import 'package:flutter/material.dart';

class SettingItem extends StatelessWidget {
  final String title;
  const SettingItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {},
      child: Padding(
        padding: EdgeInsets.only(left: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            const Icon(
              Icons.arrow_right,
              size: 36,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}

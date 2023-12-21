import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String title;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Function? onTap;
  const AppButton(
      {super.key,
      required this.title,
      this.width = double.maxFinite,
      this.height = 60,
      this.onTap,
      this.backgroundColor = const Color(0xff0095FF)});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: () {
          onTap == null ? null : onTap!();
        },
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(backgroundColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
        ),
        child: Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

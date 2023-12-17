import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String title;
  final double? width;
  final double? height;
  final Function? onTap;
  const AppButton(
      {super.key,
      required this.title,
      this.width = double.maxFinite,
      this.height,
      this.onTap});

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
          backgroundColor: const MaterialStatePropertyAll(Color(0xff0095FF)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
          padding: MaterialStateProperty.all(const EdgeInsets.all(22)),
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

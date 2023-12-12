import 'package:bahasaku/src/Theme/TColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckButton extends StatelessWidget {
  final Function onTap;
  const CheckButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(TColors.primaryColor),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50))),
            padding:
                MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 16))),
        onPressed: () {
          onTap();
        },
        child: Text('Check Answer'),
      ),
    );
  }
}

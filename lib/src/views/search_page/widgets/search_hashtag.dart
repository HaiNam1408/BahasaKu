import 'package:flutter/material.dart';

class SearchHashTag extends StatelessWidget {
  final String hashtag;
  const SearchHashTag({super.key, required this.hashtag});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: const ButtonStyle(
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)))),
            backgroundColor: MaterialStatePropertyAll(Colors.blue)),
        onPressed: null,
        child: Text(
          '#$hashtag',
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ));
  }
}

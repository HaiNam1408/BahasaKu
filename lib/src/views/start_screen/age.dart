import 'package:bahasaku/src/common_widgets/app_button.dart';
import 'package:bahasaku/src/common_widgets/prev_button.dart';
import 'package:bahasaku/src/views/start_screen/name.dart';
import 'package:flutter/material.dart';

class Age extends StatelessWidget {
  const Age({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          toolbarHeight: 66,
          leadingWidth: 66,
          leading: const PrevButton()),
      body: Container(
        padding: const EdgeInsets.all(24),
        margin: const EdgeInsets.only(top: 72),
        child: Column(
          children: [
            const Text(
              "How old are you?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 36),
            const TextField(
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, letterSpacing: 0.2),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Colors.lightBlueAccent),
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.blue),
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                )),
            const SizedBox(height: 36),
            AppButton(
                title: 'Next',
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Name()));
                }),
            const SizedBox(height: 36),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Name()));
                    },
                    child: const Text(
                      "Skip",
                      style: TextStyle(fontSize: 16),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}

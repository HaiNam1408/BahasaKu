import 'package:bahasaku/src/common_widgets/app_button.dart';
import 'package:bahasaku/src/common_widgets/prev_button.dart';
import 'package:bahasaku/src/provider/current_user.dart';
import 'package:bahasaku/src/views/start_screen/name.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Age extends StatefulWidget {
  const Age({super.key});

  @override
  State<Age> createState() => _AgeState();
}

class _AgeState extends State<Age> {
  @override
  Widget build(BuildContext context) {
    TextEditingController textCtrl = TextEditingController();
    int? age;
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
            TextField(
                onChanged: (value) {
                  age = int.parse(value);
                },
                controller: textCtrl,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, letterSpacing: 0.2),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
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
                  if (age != null) {
                    Provider.of<CurrentUser>(context, listen: false)
                        .updateAge(age!);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Name()));
                  }
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

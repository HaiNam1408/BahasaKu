import 'package:bahasaku/src/common_widgets/app_button.dart';
import 'package:bahasaku/src/common_widgets/prev_button.dart';
import 'package:bahasaku/src/provider/user_provider.dart';
import 'package:bahasaku/src/views/start_screen/email.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Name extends StatefulWidget {
  @override
  State<Name> createState() => _NameState();
}

class _NameState extends State<Name> {
  TextEditingController textCtrl = TextEditingController();
  String? name;
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
              "What is your name?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 36),
            TextField(
                onChanged: (value) {
                  name = value;
                },
                controller: textCtrl,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, letterSpacing: 0.2),
                keyboardType: TextInputType.text,
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
                  if (name != null) {
                    Provider.of<UserProvider>(context, listen: false)
                        .updateName(name!);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Email()));
                  }
                }),
          ],
        ),
      ),
    );
  }
}

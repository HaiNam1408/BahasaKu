import 'package:bahasaku/src/common_widgets/app_button.dart';
import 'package:bahasaku/src/common_widgets/prev_button.dart';
import 'package:bahasaku/src/provider/current_user.dart';
import 'package:bahasaku/src/services/firebase_services.dart';
import 'package:bahasaku/src/views/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Password extends StatefulWidget {
  const Password({super.key});
  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  bool passwordVisible = true;
  TextEditingController textCtrl = TextEditingController();
  String? password;
  List statusColor = [
    const Color(0xFFBE222E),
    const Color(0xFFBE442E),
    const Color(0xFFBE6B2E),
    const Color(0xFFBDBE2E),
    const Color(0xFF64BE2E),
    const Color(0xFF2EBE55),
  ];

  int statusIndex = 0;

  void updateStatus(int index) {
    setState(() {
      statusIndex = index;
    });
  }

  String checkPassword(String value) {
    RegExp regex5 = RegExp(r'^().{8,}$');
    RegExp regex4 = RegExp(r'^(?=.*?[a-z]).{8,}$');
    RegExp regex3 = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z]).{8,}$');
    RegExp regex2 = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
    RegExp regex1 =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value == '') return '';
    if (regex1.hasMatch(value)) {
      updateStatus(5);
      return 'How strong your password: Super Strong';
    } else if (regex2.hasMatch(value)) {
      updateStatus(4);
      return 'How strong your password: Strong';
    } else if (regex3.hasMatch(value)) {
      updateStatus(3);
      return 'How strong your password: Medium';
    } else if (regex4.hasMatch(value)) {
      updateStatus(2);
      return 'How strong your password: Weak';
    } else if (regex5.hasMatch(value)) {
      updateStatus(1);
      return 'How strong your password: Super Weak';
    }
    updateStatus(0);
    return '*Must be at least 8 characters';
  }

  String passwordStatus = '';

  @override
  void dispose() {
    textCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CurrentUser userProvider = Provider.of<CurrentUser>(context, listen: false);
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
              "Set up your password",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 36),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  passwordStatus = checkPassword(value);
                });
                password = value;
              },
              controller: textCtrl,
              obscureText: passwordVisible,
              style: const TextStyle(fontSize: 16, letterSpacing: 0.2),
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(20),
                  enabledBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Colors.lightBlueAccent),
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.blue),
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },
                    icon: Icon(passwordVisible
                        ? Icons.visibility_off
                        : Icons.visibility),
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  passwordStatus,
                  style: TextStyle(
                      fontSize: 11,
                      letterSpacing: -0.24,
                      color: statusColor[statusIndex]),
                ),
              ],
            ),
            const SizedBox(height: 36),
            AppButton(
                title: 'Start',
                onTap: () {
                  if (password != null && statusIndex > 1) {
                    userProvider.updatePassword(password!);
                    userProvider.addNewUser();
                    String email = userProvider.email!;
                    String name = userProvider.name!;
                    FirebaseServices.signUpUserByEmailPassword(
                        email, password!, name, context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  }
                }),
          ],
        ),
      ),
    );
  }
}

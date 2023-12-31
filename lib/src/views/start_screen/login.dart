import 'package:bahasaku/src/services/firebase_services.dart';
import 'package:bahasaku/src/utils/TColors.dart';
import 'package:bahasaku/src/common_widgets/app_button.dart';
import 'package:bahasaku/src/common_widgets/model_switch_account.dart';
import 'package:bahasaku/src/views/start_screen/register.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isEmailCorrect = false;
  bool passwordVisible = true;
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    'assets/images/LogoStarter.png',
                    height: 360,
                  )),
              Positioned(
                top: 360,
                left: 0,
                right: 0,
                bottom: 0,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //INPUT EMAIL
                          const Text(
                            'Input Your Email',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: TColors.primaryBoldColor),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            onChanged: (val) {
                              isEmailCorrect = isEmail(val);
                              email = val;
                            },
                            controller: emailCtrl,
                            decoration: const InputDecoration(
                              hintText: 'Email....',
                              contentPadding: EdgeInsets.all(20),
                              hintStyle: TextStyle(fontSize: 15),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: TColors.primaryBoldColor),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: TColors.primaryBoldColor),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                            ),
                          ),
                          const SizedBox(height: 10),
                          //INPUT PASSWORD
                          const Text(
                            'Input Password',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: TColors.primaryBoldColor),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            onChanged: (val) {
                              password = val;
                            },
                            controller: passwordCtrl,
                            obscureText: passwordVisible,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    passwordVisible = !passwordVisible;
                                  });
                                },
                                icon: Icon(passwordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              ),
                              hintText: 'Password....',
                              contentPadding: const EdgeInsets.all(20),
                              hintStyle: const TextStyle(fontSize: 15),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: TColors.primaryBoldColor),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: TColors.primaryBoldColor),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                            ),
                          ),
                          const SizedBox(height: 24),
                          AppButton(
                              title: 'Login',
                              height: 60,
                              onTap: () {
                                if (email != null && password != null) {
                                  FirebaseServices.signInUserByEmailPassword(
                                      email!, password!, context);
                                }
                              }),
                        ],
                      ),
                      const SizedBox(height: 20),
                      //Login with GoogleForm
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () {
                                showModalBottomSheet<void>(
                                  elevation: 2.0,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(30),
                                          topLeft: Radius.circular(30))),
                                  backgroundColor: const Color(0xffFAFAFA),
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const ModelSwitchAccount();
                                  },
                                );
                              },
                              child: const Text(
                                'Login With Google',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              )),
                          Image.asset('assets/images/GoogleLogo2.png',
                              height: 16)
                        ],
                      ),
                      const SizedBox(height: 36),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Doesn't have account?",
                            style: TextStyle(color: Color(0xff3C3C43)),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Register()));
                              },
                              child: const Text(
                                'Register',
                                style: TextStyle(color: TColors.primaryColor),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

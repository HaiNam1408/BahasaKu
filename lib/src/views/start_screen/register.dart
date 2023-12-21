import 'package:bahasaku/src/common_widgets/app_button.dart';
import 'package:bahasaku/src/views/start_screen/age.dart';
import 'package:bahasaku/src/views/start_screen/login.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/images/Ellipse1.png',
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            top: 140,
            child: SizedBox(
              child: Image.asset(
                'assets/images/IlustrationRegister.png',
                alignment: Alignment.center,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 35,
            left: 35,
            top: 520,
            child: Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Create Your Profile',
                      style: TextStyle(fontSize: 26, letterSpacing: -0.24)),
                  const Text(
                    'Now!',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 32),
                  const SizedBox(
                    child: Text(
                      'Create a profile to save your learning progress and keep learning for free!',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xff989EA7)),
                    ),
                  ),
                  const SizedBox(height: 72),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 130,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50))),
                          ),
                          child: const Text(
                            "Back",
                            style: TextStyle(
                                color: Color(0xff0693F1),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      AppButton(
                          title: 'Next',
                          width: 130,
                          height: 50,
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Age()));
                          }),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

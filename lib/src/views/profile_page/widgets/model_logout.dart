import 'package:bahasaku/src/services/firebase_services.dart';
import 'package:bahasaku/src/views/start_screen/login.dart';
import 'package:flutter/material.dart';

class ModelLogout extends StatelessWidget {
  const ModelLogout({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 300,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Logout Account?',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text('Are you sure want to logout this account?',
                  textAlign: TextAlign.center),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: ElevatedButton(
                    style: const ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)))),
                      backgroundColor:
                          MaterialStatePropertyAll(Color(0xffFF2442)),
                    ),
                    onPressed: () async {
                      await FirebaseServices().googleSignOut();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                    child: const Text(
                      'Logout',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ))
            ],
          ),
        ));
  }
}

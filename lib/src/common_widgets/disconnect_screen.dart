import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class DisconnectScreen extends StatelessWidget {
  const DisconnectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(image: AssetImage('assets/images/EmptyState.png')),
          const Text(
            'Not Connected',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 12,
          ),
          const SizedBox(
            width: 300,
            child: Text(
              'Ups.. You are not connected to internet Try again',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 180,
            child: ElevatedButton(
                style: const ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))))),
                onPressed: () async {
                  ConnectivityResult result =
                      await Connectivity().checkConnectivity();
                  // print(result.toString());
                },
                child: const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    'Try Again',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                )),
          )
        ],
      )),
    );
  }
}

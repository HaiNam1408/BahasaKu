import 'package:bahasaku/src/common_widgets/card_container.dart';
import 'package:bahasaku/src/views/profile_page/widgets/model_logout.dart';
import 'package:bahasaku/src/views/profile_page/widgets/model_switch_account.dart';
import 'package:flutter/material.dart';

class ProfileAccount extends StatelessWidget {
  const ProfileAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return CardContainer(
        title: 'My Account',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              style: const ButtonStyle(
                  padding: MaterialStatePropertyAll(EdgeInsets.all(0))),
              onPressed: () {
                showModalBottomSheet(
                    elevation: 2.0,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30))),
                    backgroundColor: const Color(0xffFAFAFA),
                    context: context,
                    builder: (BuildContext context) {
                      return const ModelSwitchAccount();
                    });
              },
              child: const Text(
                'Switch to Another Account',
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
              ),
            ),
            TextButton(
              style: const ButtonStyle(
                  padding: MaterialStatePropertyAll(EdgeInsets.all(0))),
              onPressed: () {
                showModalBottomSheet(
                    elevation: 2.0,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30))),
                    backgroundColor: const Color(0xffFAFAFA),
                    context: context,
                    builder: (BuildContext context) {
                      return const ModelLogout();
                    });
              },
              child: const Text(
                'Logout Account',
                style: TextStyle(
                    color: Colors.orange, fontWeight: FontWeight.w500),
              ),
            )
          ],
        ));
  }
}

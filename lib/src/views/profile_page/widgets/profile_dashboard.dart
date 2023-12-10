import 'package:bahasaku/src/common_widgets/card_container.dart';
import 'package:bahasaku/src/views/home_page/home_page.dart';
import 'package:bahasaku/src/views/privacy_page/privacy_page.dart';
import 'package:bahasaku/src/views/setting_page/setting_page.dart';
import 'package:flutter/material.dart';

class ProfileDashBoard extends StatelessWidget {
  const ProfileDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return CardContainer(
        title: 'Dashboard',
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingPage()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                          width: 37,
                          height: 37,
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/images/setting.png',
                            scale: 1.5,
                          )),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        'Settings',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  const Icon(
                    Icons.arrow_right,
                    size: 40,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomePage(pageIndex: 2)))
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                          width: 37,
                          height: 37,
                          decoration: const BoxDecoration(
                            color: Colors.yellow,
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/images/Cup.png',
                            scale: 1.8,
                          )),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        'Archivements',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                            bottom: Radius.circular(20))),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '2 New',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 9),
                          ),
                          InkWell(
                              onTap: () {},
                              child: const Icon(
                                Icons.arrow_right,
                                size: 40,
                                color: Colors.grey,
                              ))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PrivacyPage()))
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                          width: 37,
                          height: 37,
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/images/privacy.png',
                            scale: 1.6,
                          )),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        'Privacy',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                            bottom: Radius.circular(20))),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Action Needed',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 9),
                          ),
                          Icon(
                            Icons.arrow_right,
                            size: 40,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}

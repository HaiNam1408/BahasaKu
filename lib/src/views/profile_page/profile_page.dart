import 'package:bahasaku/src/common_widgets/action_button.dart';
import 'package:bahasaku/src/utils/constant.dart';
import 'package:bahasaku/src/views/home_page/home_page.dart';
import 'package:bahasaku/src/views/profile_page/widgets/profile_account.dart';
import 'package:bahasaku/src/views/profile_page/widgets/profile_dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final userData = FirebaseAuth.instance.currentUser;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          toolbarHeight: 66,
          centerTitle: true,
          title: const Text(
            'My Profile',
            style: TextStyle(fontSize: 18),
          ),
          actions: const [ActionButton()],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'assets/images/Vector 3.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
              Positioned(
                top: 130,
                left: 30,
                right: 30,
                bottom: 0,
                child: ListView(
                  padding: const EdgeInsets.only(top: 10),
                  scrollDirection: Axis.vertical,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(userData
                                          ?.photoURL ??
                                      'https://www.shareicon.net/data/512x512/2016/05/24/770117_people_512x512.png'),
                                  radius: 50,
                                ),
                                const SizedBox(width: 15),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: getWidth(context) * 0.45,
                                      child: Text(
                                        userData?.displayName ?? 'Guess',
                                        softWrap: true,
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      'Newbie',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            InkWell(
                              onTap: () {},
                              child: Image.asset(
                                'assets/images/NotePencil.png',
                                width: 32,
                                height: 32,
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 38, bottom: 15),
                          child: Divider(
                            color: Colors.grey,
                            height: 1,
                          ),
                        ),
                        IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Column(
                                children: [
                                  Text(
                                    '2+ hours',
                                    style: TextStyle(
                                        letterSpacing: -0.7, fontSize: 18),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Total Learn',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 10),
                                  ),
                                ],
                              ),
                              const VerticalDivider(
                                  color: Colors.grey, width: 10),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HomePage()));
                                },
                                child: const Column(
                                  children: [
                                    Text(
                                      '20',
                                      style: TextStyle(
                                          letterSpacing: -0.7, fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Achivements',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 10),
                                    ),
                                  ],
                                ),
                              ),
                              const VerticalDivider(
                                  color: Colors.grey, width: 10),
                              const Column(
                                children: [
                                  Text(
                                    '2',
                                    style: TextStyle(
                                        letterSpacing: -0.7, fontSize: 18),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Language',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 10),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 26),
                        const ProfileDashBoard(),
                        const SizedBox(height: 26),
                        const ProfileAccount()
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

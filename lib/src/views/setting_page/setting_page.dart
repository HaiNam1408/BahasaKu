import 'package:bahasaku/src/common_widgets/action_button.dart';
import 'package:bahasaku/src/common_widgets/card_container.dart';
import 'package:bahasaku/src/common_widgets/prev_button.dart';
import 'package:bahasaku/src/views/setting_page/widgets/setting_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool light = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          toolbarHeight: 66,
          leadingWidth: 66,
          centerTitle: true,
          title: const Text(
            'Settings',
            style: TextStyle(
                fontSize: 18, letterSpacing: -0.7, color: Colors.black),
          ),
          leading: const PrevButton(),
          actions: const [ActionButton()],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Positioned(
                  bottom: 0,
                  right: 40,
                  left: 30,
                  top: 140,
                  child: SizedBox(
                    child: Column(
                      children: [
                        const CardContainer(
                            title: 'Language',
                            child: Column(
                              children: [
                                SettingItem(title: 'First Language'),
                                SizedBox(
                                  height: 20,
                                ),
                                SettingItem(title: 'Second Language'),
                              ],
                            )),
                        const SizedBox(
                          height: 30,
                        ),
                        CardContainer(
                            title: 'Other Settings',
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Dark Mode',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                      FlutterSwitch(
                                          toggleSize: 15,
                                          padding: 3,
                                          height: 20,
                                          width: 32,
                                          value: light,
                                          activeColor: Colors.blue,
                                          onToggle: (bool value) {
                                            setState(() {
                                              light = value;
                                            });
                                          }),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                const SettingItem(title: 'Notification'),
                                const SizedBox(
                                  height: 30,
                                ),
                                const SettingItem(title: 'Text Size'),
                                const SizedBox(
                                  height: 30,
                                ),
                                const SettingItem(title: 'Sound and Volume'),
                                const SizedBox(
                                  height: 30,
                                ),
                                const SettingItem(title: 'Privacy and Policy'),
                                const SizedBox(
                                  height: 30,
                                ),
                                const SettingItem(title: 'Terms and Condition'),
                              ],
                            ))
                      ],
                    ),
                  ))
            ],
          ),
        ));
  }
}

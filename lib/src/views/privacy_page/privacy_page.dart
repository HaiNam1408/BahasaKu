import 'package:bahasaku/src/common_widgets/prev_button.dart';
import 'package:flutter/material.dart';

class PrivacyPage extends StatefulWidget {
  const PrivacyPage({super.key});

  @override
  State<PrivacyPage> createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  bool userNameVisible = true;
  bool passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 66,
          leadingWidth: 66,
          title: const Text('Privacy',
              style: TextStyle(fontSize: 18, letterSpacing: -0.7)),
          leading: const PrevButton(),
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
                  'assets/images/Background.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
              Positioned(
                  right: 25,
                  left: 25,
                  bottom: 0,
                  top: 130,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.only(top: 10),
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: const BoxDecoration(),
                            width: 120,
                            child: Stack(
                              children: [
                                const CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://www.shareicon.net/data/512x512/2016/05/24/770117_people_512x512.png'),
                                  radius: 55,
                                ),
                                Positioned(
                                    left: 80,
                                    bottom: 0,
                                    child: CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.white,
                                      child: CircleAvatar(
                                        radius: 18,
                                        backgroundColor: Colors.blue,
                                        child: IconButton(
                                            onPressed: () {},
                                            icon: const Center(
                                                child: Icon(
                                              Icons.edit,
                                              size: 18,
                                              color: Colors.white,
                                            ))),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Column(
                            children: [
                              Text(
                                'John Doe',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Newbie',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 13),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Name',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      initialValue: "John Doe",
                                      style: const TextStyle(
                                          color: Colors.grey,
                                          letterSpacing: 0.2,
                                          fontSize: 16),
                                      keyboardType: TextInputType.text,
                                      decoration: const InputDecoration(
                                          contentPadding: EdgeInsets.all(16),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1, color: Colors.grey),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(50))),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1, color: Colors.blue),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(50)))),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Username',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      obscureText: userNameVisible,
                                      initialValue: "johnDOE",
                                      style: const TextStyle(
                                          color: Colors.grey,
                                          letterSpacing: -0.24,
                                          fontSize: 16),
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.all(
                                              16),
                                          enabledBorder:
                                              const OutlineInputBorder(
                                                  borderSide:
                                                      BorderSide(
                                                          width: 1,
                                                          color: Colors.grey),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(50))),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                                  borderSide:
                                                      BorderSide(
                                                          width: 1,
                                                          color: Colors.blue),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(50))),
                                          suffixIcon: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  userNameVisible =
                                                      !userNameVisible;
                                                });
                                              },
                                              icon: Icon(userNameVisible
                                                  ? Icons.visibility
                                                  : Icons.visibility_off))),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Email',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      initialValue: "John.doe@gmail.com",
                                      style: const TextStyle(
                                          color: Colors.grey,
                                          letterSpacing: 0.2,
                                          fontSize: 16),
                                      keyboardType: TextInputType.text,
                                      decoration: const InputDecoration(
                                          contentPadding: EdgeInsets.all(16),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1, color: Colors.grey),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(50))),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1, color: Colors.blue),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(50)))),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Password',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      obscureText: passwordVisible,
                                      initialValue: "John Doe",
                                      style: const TextStyle(
                                          color: Colors.grey,
                                          letterSpacing: 0.2,
                                          fontSize: 16),
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.all(
                                              16),
                                          enabledBorder:
                                              const OutlineInputBorder(
                                                  borderSide:
                                                      BorderSide(
                                                          width: 1,
                                                          color: Colors.grey),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(50))),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                                  borderSide:
                                                      BorderSide(
                                                          width: 1,
                                                          color: Colors.blue),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(50))),
                                          suffixIcon: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  passwordVisible =
                                                      !passwordVisible;
                                                });
                                              },
                                              icon: Icon(passwordVisible
                                                  ? Icons.visibility
                                                  : Icons.visibility_off))),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Age',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 11),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '21',
                                        style: TextStyle(
                                            fontSize: 13,
                                            letterSpacing: 0.38,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Joined From',
                                      style: TextStyle(
                                          fontSize: 10,
                                          letterSpacing: 0.38,
                                          color: Colors.grey),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '5 Jan 2022',
                                      style: TextStyle(
                                        fontSize: 12,
                                        letterSpacing: 0.38,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ))
            ],
          ),
        ));
  }
}

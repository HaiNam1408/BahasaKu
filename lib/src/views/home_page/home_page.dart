import 'package:bahasaku/src/common_widgets/disconnect_screen.dart';
import 'package:bahasaku/src/views/achievement_page/achievement_page.dart';
import 'package:bahasaku/src/views/learn_page/learn_page.dart';
import 'package:bahasaku/src/views/profile_page/profile_page.dart';
import 'package:bahasaku/src/views/search_page/search_page.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  final int pageIndex;
  const HomePage({super.key, this.pageIndex = 0});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List pages = [
    const LearnPage(),
    const SearchPage(),
    const AchievementPage(),
    const ProfilePage()
  ];

  late int currentIndex;

  @override
  void initState() {
    currentIndex = widget.pageIndex;
  }

  void onTapNavigatorBar(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: Connectivity().onConnectivityChanged,
          builder: (context, AsyncSnapshot<ConnectivityResult> snapshot) {
            if (snapshot.hasData) {
              ConnectivityResult? result = snapshot.data;
              if (result == ConnectivityResult.none) {
                return const DisconnectScreen();
              } else {
                return pages[currentIndex];
              }
            }
            return const Center(
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue)),
            );
          }),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Color.fromRGBO(38, 50, 56, 0.43),
              width: 1.0,
            ),
          ),
        ),
        child: NavigationBar(
          backgroundColor: Colors.white,
          height: 72,
          selectedIndex: currentIndex,
          onDestinationSelected: onTapNavigatorBar,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          destinations: [
            NavigationDestination(
                icon: SvgPicture.asset('assets/icon/BookOpenText.svg'),
                label: 'Learn'),
            NavigationDestination(
                icon: SvgPicture.asset('assets/icon/Binoculars.svg'),
                label: 'Search'),
            NavigationDestination(
                icon: SvgPicture.asset('assets/icon/Trophy.svg'),
                label: 'Achievement'),
            NavigationDestination(
                icon: SvgPicture.asset('assets/icon/UserCircle.svg'),
                label: 'Profile'),
          ],
        ),
      ),
    );
  }
}

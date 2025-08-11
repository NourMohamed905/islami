import 'package:flutter/material.dart';
import 'package:islami/nav_bar_selected.dart';
import 'package:islami/nav_bar_unselected.dart';
import 'package:islami/tabs/hadeth_tab.dart';
import 'package:islami/tabs/quran/quran_tab.dart';
import 'package:islami/tabs/radio_tab.dart';
import 'package:islami/tabs/seb7a_tab.dart';
import 'package:islami/tabs/time_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/splash';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    Seb7aTab(),
    RadioTab(),
    TimeTab(),
  ];

  List<String> backgroundImageName = [
    'quran_background',
    'hadeth_background',
    'seb7a_background',
    'radio_background',
    'time_background',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/${backgroundImageName[currentIndex]}.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Image.asset(
              'assets/images/header.png',
            ),
            Expanded(child: tabs[currentIndex]),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              if (currentIndex == index) return;

              currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: NavBarUnselected(imageName: 'quran'),
                activeIcon: NavBarSelected(imageName: 'quran'),
                label: 'Quran'),
            BottomNavigationBarItem(
                icon: NavBarUnselected(imageName: 'hadeth'),
                activeIcon: NavBarSelected(imageName: 'hadeth'),
                label: 'Hadeth'),
            BottomNavigationBarItem(
                icon: NavBarUnselected(imageName: 'seb7a'),
                activeIcon: NavBarSelected(imageName: 'seb7a'),
                label: 'Seb7a'),
            BottomNavigationBarItem(
                icon: NavBarUnselected(imageName: 'radio'),
                activeIcon: NavBarSelected(imageName: 'radio'),
                label: 'Radio'),
            BottomNavigationBarItem(
                icon: NavBarUnselected(imageName: 'time'),
                activeIcon: NavBarSelected(imageName: 'time'),
                label: 'Time'),
          ]),
    );
  }
}

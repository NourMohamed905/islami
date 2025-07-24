import 'package:flutter/material.dart';
import 'package:islami/nav_bar_selected.dart';
import 'package:islami/nav_bar_unselected.dart';
import 'package:islami/tabs/hadeth_tab.dart';
import 'package:islami/tabs/quran_tab.dart';
import 'package:islami/tabs/radio_tab.dart';
import 'package:islami/tabs/seb7a_tab.dart';
import 'package:islami/tabs/time_tab.dart';


class HomeScreen extends StatefulWidget {

  static const String routeName = '/splash';

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

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: tabs[currentIndex],
    
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            if (currentIndex == index){
              return;
            };
            print('Current Index: $index');
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

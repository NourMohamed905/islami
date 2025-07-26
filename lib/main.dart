import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/home_screen.dart';
import 'package:islami/tabs/quran/sura_details_screen.dart';


void main() {
  runApp( IslamiApp());
}

class IslamiApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName : (_) => HomeScreen(),
        SuraDetailsScreen.routeName : (_) => SuraDetailsScreen(),
      },
      theme: AppTheme.darkTheme ,
      initialRoute: HomeScreen.routeName,
    );
  }
}



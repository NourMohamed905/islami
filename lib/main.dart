import 'package:flutter/material.dart';
import 'package:islami/splash_screen.dart';

void main() {
  runApp( IslamiApp());
}

class IslamiApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName : (_) => SplashScreen(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}



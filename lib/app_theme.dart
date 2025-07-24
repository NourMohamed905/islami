import 'dart:ui';

import 'package:flutter/material.dart';

class AppTheme{

  static const Color primary = Color(0xFFE2BE7F);
  static const Color black = Color(0xFF202020);
  static const Color white = Color(0xFFFFFFFF);

  static ThemeData darkTheme = ThemeData(
    primaryColor: primary,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primary,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: false,
      selectedItemColor: white
    ),
   
  );
  
  }
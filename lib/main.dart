import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/home_screen.dart';
import 'package:islami/on_boarding_screens/on_boarding_screen.dart';
import 'package:islami/tabs/hadeth/hadeth.dart';
import 'package:islami/tabs/hadeth/hadeth_details.dart';
import 'package:islami/tabs/quran/quran_service.dart';
import 'package:islami/tabs/quran/sura_details_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final bool showOnboarding = prefs.getBool('completed') ?? true;

  await QuranService.getMostRecentlySuras();

  runApp(IslamiApp(
    showOnboarding: showOnboarding,
  ));
}

class IslamiApp extends StatelessWidget {
  final bool showOnboarding;
  const IslamiApp({super.key, required this.showOnboarding});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        SuraDetailsScreen.routeName: (_) => SuraDetailsScreen(),
        on_boarding_screen.routeName: (_) => on_boarding_screen(),
        HadethDetailsScreen.routeName: (_) => HadethDetailsScreen(),
      },
      theme: AppTheme.darkTheme,
      initialRoute:
          showOnboarding ? on_boarding_screen.routeName : HomeScreen.routeName,
    );
  }
}

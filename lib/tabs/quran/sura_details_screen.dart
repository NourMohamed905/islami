import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/quran/sura.dart';

class SuraDetailsScreen extends StatelessWidget {
  static const String routeName = '/suraDetails';

  @override
  Widget build(BuildContext context) {
    Sura sura = ModalRoute.of(context)!.settings.arguments as Sura;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(sura.englishName),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/details_header_left.png',
                 height: screenHeight *0.1,
                 fit: BoxFit.cover,
                ),
                Text(
                  sura.arabicName,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: AppTheme.primary,
                      ),
                ),
                Image.asset(
                  'assets/images/details_header_right.png',
                  height: screenHeight *0.1,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),

          Spacer(),
        
          Image.asset('assets/images/footer.png',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        
        ],
      ),
    );
  }
}

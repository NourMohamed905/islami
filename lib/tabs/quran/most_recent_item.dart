import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/quran/sura.dart';
import 'package:islami/tabs/quran/sura_details_screen.dart';

class MostRecentItem extends StatelessWidget {
  Sura sura;
  MostRecentItem(this.sura, {super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Size screenSize = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(SuraDetailsScreen.routeName, arguments: sura);
      },
      child: Container(
        padding: EdgeInsets.only(left: 12, top: 8, right: 8, bottom: 8),
        decoration: BoxDecoration(
          color: AppTheme.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        height: double.infinity,
        width: screenSize.width * 0.7,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  sura.englishName,
                  style: textTheme.headlineMedium!.copyWith(
                    color: AppTheme.black,
                  ),
                ),
                Text(
                  sura.arabicName,
                  style: textTheme.headlineMedium!.copyWith(
                    color: AppTheme.black,
                  ),
                ),
                Text(
                  '${sura.ayatCount} Verses',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: AppTheme.black,
                      ),
                ),
              ],
            ),
            Image.asset(
              'assets/images/most_recent.png',
              width: screenSize.width * 0.3,
              height: screenSize.width * 0.3,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }
}

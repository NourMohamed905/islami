import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/quran/quran_service.dart';
import 'package:islami/tabs/quran/sura_details_screen.dart';
import 'package:islami/tabs/quran/suras_list.dart';

class QuranTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double ScreenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            'Suras List',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 20),
            itemCount:
                QuranService.suras.length, // Total number of Suras in the Quran
            itemBuilder: (_, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    SuraDetailsScreen.routeName,
                    arguments: QuranService.suras[index],
                  );
                },
                child: SurasList(
                  sura: QuranService.suras[index],
                ),
              );
            },
            separatorBuilder: (_, __) => Divider(
              color: AppTheme.white,
              thickness: 1,
              indent: ScreenWidth * 0.1,
              endIndent: ScreenWidth * 0.1,
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/quran/most_recent.dart';
import 'package:islami/tabs/quran/quran_service.dart';
import 'package:islami/tabs/quran/sura.dart';
import 'package:islami/tabs/quran/sura_details_screen.dart';
import 'package:islami/tabs/quran/suras_list.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double ScreenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: TextField(
            style: textTheme.titleMedium,
            decoration: InputDecoration(
              hintText: 'Sura Name',
              prefixIcon: SvgPicture.asset(
                'assets/icons/quran.svg',
                colorFilter: ColorFilter.mode(
                  AppTheme.primary,
                  BlendMode.srcIn,
                ),
                width: 24,
                height: 24,
                fit: BoxFit.scaleDown,
              ),
            ),
            onChanged: (qurey) {
              QuranService.searchSura(qurey);
              setState(() {});
            },
          ),
        ),
        MostRecent(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            'Suras List',
            style: textTheme.titleMedium,
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 20),
            itemCount:
                QuranService.suras.length, // Total number of Suras in the Quran
            itemBuilder: (_, index) {
              Sura sura = QuranService.suras[index];
              return InkWell(
                onTap: () async {
                  QuranService.addMostRecent(sura);

                  await Navigator.of(context).pushNamed(
                    SuraDetailsScreen.routeName,
                    arguments: sura,
                  );
                  setState(() {});
                },
                child: SurasItem(sura),
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

import 'package:flutter/material.dart';
import 'package:islami/tabs/quran/sura.dart';

class SurasItem extends StatelessWidget {
  Sura sura;
  SurasItem(this.sura, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 52,
          height: 52,
          alignment: Alignment.center,
          margin: EdgeInsets.only(right: 24),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/sura_number_frame.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Text(
            '${sura.num}',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              sura.englishName,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Text(
              '${sura.ayatCount} Verses',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
        Spacer(),
        Text(sura.arabicName, style: Theme.of(context).textTheme.titleSmall),
      ],
    );
  }
}

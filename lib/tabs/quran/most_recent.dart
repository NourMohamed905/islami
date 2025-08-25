import 'package:flutter/material.dart';
import 'package:islami/tabs/quran/most_recent_item.dart';
import 'package:islami/tabs/quran/quran_service.dart';
import 'package:islami/tabs/quran/sura.dart';

class MostRecent extends StatelessWidget {
  const MostRecent({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Visibility(
      visible: QuranService.mostRecently.isNotEmpty,
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Most Recent',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: screenSize.height * 0.16,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: QuranService.mostRecently
                    .length, // Example count, replace with actual data length
                itemBuilder: (_, index) => MostRecentItem(
                  QuranService.mostRecently.reversed.toList()[index],
                ),
                separatorBuilder: (_, __) => const SizedBox(width: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

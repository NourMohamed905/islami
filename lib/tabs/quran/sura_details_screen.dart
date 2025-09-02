/*import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/quran/quran_service.dart';
import 'package:islami/tabs/quran/sura.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = '/suraDetails';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  late Sura sura;

  String suraContent = '';

  @override
  Widget build(BuildContext context) {
    sura = ModalRoute.of(context)!.settings.arguments as Sura;
    loadSura();
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
                  height: screenHeight * 0.1,
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
                  height: screenHeight * 0.1,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: suraContent.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 8,
                        runSpacing: 12,
                        children: [
                          Text(
                            suraContent,
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: AppTheme.primary,
                                    ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
            ),
          ),
          Image.asset(
            'assets/images/footer.png',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }

  void loadSura() async {
    String suraFileContent = await QuranService.loadSuraFile(sura.num);
    setState(() {
      suraContent = suraFileContent;
    });
  }
}*/
import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/quran/quran_service.dart';
import 'package:islami/tabs/quran/sura.dart';
import 'package:islami/widgets/loading_indicator.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = '/suraDetails';

  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  late Sura sura;
  List<String> ayat = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    sura = ModalRoute.of(context)!.settings.arguments as Sura;
    loadSura();
  }

  void loadSura() async {
    String content = await QuranService.loadSuraFile(sura.num);
    setState(() {
      ayat = content.trim().split('\n');
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(sura.englishName),
      ),
      body: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/details_header_left.png',
                  height: screenHeight * 0.1,
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
                  height: screenHeight * 0.1,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),

          Expanded(
            child: ayat.isEmpty
                ? LoadingIndicator()
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Wrap(
                            spacing: 2,
                            runSpacing: 14,
                            alignment: WrapAlignment.start,
                            children: List.generate(ayat.length, (index) {
                              return Text(
                                '${ayat[index]} (${index + 1})',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: AppTheme.primary,
                                    ),
                                textAlign: TextAlign.center,
                              );
                            }),
                          ),
                        ),
                      ),
                    ),
                  ),
          ),

          // Footer
          Image.asset(
            'assets/images/footer.png',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}

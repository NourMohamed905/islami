import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/hadeth/hadeth.dart';
import 'package:islami/tabs/hadeth/hadeth_details.dart';
import 'package:islami/widgets/loading_indicator.dart';

class HadethItem extends StatefulWidget {
  int index;

  HadethItem({required this.index});

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  Hadeth? hadeth;

  @override
  Widget build(BuildContext context) {
    if (hadeth == null) {
      loadHadeth();
    }
    TextTheme textTheme = Theme.of(context).textTheme;
    Size screenSize = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(HadethDetailsScreen.routeName, arguments: hadeth);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4),
        width: screenSize.width * 0.9,
        decoration: BoxDecoration(
          color: AppTheme.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 8, bottom: 4, left: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/leftBlackCorner.png',
                    height: screenSize.height * 0.1,
                    //fit: BoxFit.fill,
                  ),
                  if (hadeth != null)
                    Expanded(
                      child: Text(
                        hadeth!.title,
                        style: textTheme.titleSmall!.copyWith(
                          color: AppTheme.black,
                          //fontSize: 10,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  Image.asset(
                    'assets/images/rightBlackCorner.png',
                    height: screenSize.height * 0.1,
                    //fit: BoxFit.fill,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/images/hadethBackground.png',
                        ),
                        fit: BoxFit.contain),
                  ),
                  child: hadeth == null
                      ? LoadingIndicator()
                      : ListView.separated(
                          itemBuilder: (_, index) => Text(
                                hadeth!.content[index],
                                style: textTheme.titleMedium!.copyWith(
                                  color: AppTheme.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                          separatorBuilder: (_, __) => SizedBox(
                                height: 4,
                              ),
                          itemCount: hadeth!.content.length)),
            ),
            Image.asset(
              'assets/images/hadethFooter.png',
              width: double.infinity,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> loadHadeth() async {
    String hadethFileContain =
        await rootBundle.loadString('assets/hadeth/h${widget.index + 1}.txt');
    List<String> hadethLines = hadethFileContain.split('\n');
    hadeth = Hadeth(
        title: hadethLines[0],
        content: hadethLines.sublist(1),
        num: widget.index + 1);
    setState(() {});
  }
}

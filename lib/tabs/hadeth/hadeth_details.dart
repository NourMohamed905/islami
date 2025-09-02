import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/hadeth/hadeth.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = '/hadethDetails';

  const HadethDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Hadeth hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth;
    double screenHeight = MediaQuery.of(context).size.height;

    // Assuming hadeth.content is the list of hadethContent

    return Scaffold(
      appBar: AppBar(
        title: Text('Hadeth ${hadeth.num}'),
      ),
      body: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.only(
              top: 8,
              left: 16,
              right: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/details_header_left.png',
                  height: screenHeight * 0.1,
                  fit: BoxFit.cover,
                ),
                Expanded(
                  child: Text(
                    hadeth.title,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: AppTheme.primary,
                        ),
                    textAlign: TextAlign.center,
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
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                itemBuilder: (_, index) => Text(
                  hadeth.content[index],
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: AppTheme.primary,
                      ),
                  textAlign: TextAlign.justify,
                ),
                separatorBuilder: (_, index) => SizedBox(
                  height: 12,
                ),
                itemCount: hadeth.content.length,
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

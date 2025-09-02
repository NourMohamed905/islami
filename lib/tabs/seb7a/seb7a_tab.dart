import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';

class Seb7aTab extends StatefulWidget {
  const Seb7aTab({super.key});

  @override
  State<Seb7aTab> createState() => _Seb7aTabState();
}

double angle = 1;
List<String> seb7aData = [
  'سُبْحَانَ اللَّهِ',
  'الْحَمْدُ لِلَّهِ',
  'اللَّهُ أَكْبَرُ',
];
int counter = 0;
int index = 0;

class _Seb7aTabState extends State<Seb7aTab> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 16, bottom: 8, left: 16, right: 16),
      child: Column(
        children: [
          Text('سَبِّحِ اسْمَ رَبِّكَ الأعلى', style: textTheme.headlineLarge),
          SizedBox(height: 16),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Image.asset('assets/images/seb7a_header.png',
                  height: screenSize.height * 0.1),
              Container(
                margin: EdgeInsets.only(top: screenSize.height * 0.1 - 10),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        onSeb7aPressed();
                      },
                      child: Transform.rotate(
                        angle: -angle,
                        child: Image.asset('assets/images/seb7aa.png',
                            height: screenSize.height * 0.4),
                      ),
                    ),
                    Column(
                      spacing: screenSize.height * 0.01,
                      children: [
                        Text(
                          seb7aData[index],
                          style: textTheme.headlineMedium!.copyWith(
                            color: AppTheme.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '$counter',
                          style: textTheme.headlineMedium!.copyWith(
                            color: AppTheme.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void onSeb7aPressed() {
    counter++;
    if (counter == 33) {
      counter = 0;
      index++;
      if (index == seb7aData.length) {
        index = 0;
      }
    }
    angle++;

    setState(() {});
  }
}

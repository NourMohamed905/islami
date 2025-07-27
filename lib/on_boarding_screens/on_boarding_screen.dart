import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/home_screen.dart';
import 'package:islami/on_boarding_screens/dot_indicator.dart';
import 'package:islami/on_boarding_screens/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

class on_boarding_screen extends StatefulWidget {
  static const String routeName = '/welcome';

  @override
  State<on_boarding_screen> createState() => _on_boarding_screenState();
}

class _on_boarding_screenState extends State<on_boarding_screen> {
  int currentIndex = 0;
  PageController pageController = PageController();
  List<Onboarding> onboardingScreens = [
    Onboarding(
      welcomeImagePath: 'assets/images/onboarding_one.png',
      title: 'Welcome to Islami App',
    ),
    Onboarding(
        welcomeImagePath: 'assets/images/onboarding_two.png',
        title: 'Welcome To Islami',
        subtitle: 'We Are Very Excited To Have You In Our Community'),
    Onboarding(
        welcomeImagePath: 'assets/images/onboarding_three.png',
        title: 'Reading the Quran',
        subtitle: 'Read, and your Lord is the Most Generous'),
    Onboarding(
        welcomeImagePath: 'assets/images/onboarding_four.png',
        title: 'Bearish',
        subtitle: 'Praise the name of your Lord, the Most High'),
    Onboarding(
        welcomeImagePath: 'assets/images/onboarding_five.png',
        title: 'Holy Quran Radio',
        subtitle:
            'You can listen to the Holy Quran Radio through the application for free and easily'),
  ];

  @override
  void initState() {
    pageController.addListener(() {
      setState(() {
        currentIndex = pageController.page?.toInt() ?? 0;
      });
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Image.asset(
              'assets/images/header.png',
              height: screenHeight * 0.2,
              fit: BoxFit.cover,
            ),
            SizedBox(height: screenHeight * 0.02),
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: onboardingScreens.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        onboardingScreens[index].welcomeImagePath,
                        height: screenHeight * 0.45,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Text(
                        onboardingScreens[index].title,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              color: AppTheme.primary,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: screenHeight * 0.06),
                      if (onboardingScreens[index].subtitle != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            onboardingScreens[index].subtitle ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: AppTheme.primary,
                                ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      Spacer(),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                  onPressed: currentIndex != 0
                                      ? () {
                                          if (currentIndex > 0) {
                                            pageController.animateToPage(
                                              currentIndex - 1,
                                              duration:
                                                  Duration(milliseconds: 300),
                                              curve: Curves.easeInOut,
                                            );
                                          }
                                        }
                                      : null,
                                  child: Text(currentIndex != 0 ? 'Back' : '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                            color: AppTheme.primary,
                                          ))),
                              TextButton(
                                  onPressed: () async {
                                    if (currentIndex == 4) {
                                      await closeOnboarding();
                                      // ignore: use_build_context_synchronously
                                      Navigator.of(context)
                                          .pushReplacementNamed(
                                        HomeScreen.routeName,
                                      );
                                    } else {
                                      pageController.animateToPage(
                                        currentIndex + 1,
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.easeInOut,
                                      );
                                    }
                                  },
                                  child: Text(
                                      currentIndex != 4 ? 'Next' : 'Finish',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                            color: AppTheme.primary,
                                          ))),
                            ],
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                DotIndicator(active: currentIndex == 0),
                                DotIndicator(active: currentIndex == 1),
                                DotIndicator(active: currentIndex == 2),
                                DotIndicator(active: currentIndex == 3),
                                DotIndicator(active: currentIndex == 4),
                              ]),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> closeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('completed', false);
  }
}

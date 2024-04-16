import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:test_app/main.dart';
import 'package:test_app/src/constants/colors.dart';
import 'package:test_app/src/constants/image_strings.dart';
import 'package:test_app/src/constants/text_strings.dart';
import 'package:test_app/src/features/authentication/models/model_on_boarding.dart';
import 'package:test_app/src/features/authentication/screens/onboarding/on_boarding_page_widget.dart';
import 'package:test_app/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:test_app/firebase_options.dart';
import 'package:test_app/src/repository/authentication_repository/authentication_repository.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = LiquidController();

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final pages = [
      OnBoardingPage(
          model: OnBoardingModel(
              title: onboardingTitle1,
              image: tOnboardingImage1,
              subTitle: onboardingsubtitle1,
              counterText: onboardingcounter1,
              bgColor: tonBoardingColor1,
              height: size.height)),
      OnBoardingPage(
          model: OnBoardingModel(
              title: onboardingTitle2,
              image: tOnboardingImage2,
              subTitle: onboardingsubtitle2,
              counterText: onboardingcounter2,
              bgColor: tonBoardingColor2,
              height: size.height)),
      OnBoardingPage(
          model: OnBoardingModel(
              title: onboardingTitle3,
              image: tOnboardingImage3,
              subTitle: onboardingsubtitle3,
              counterText: onboardingcounter3,
              bgColor: tonBoardingColor3,
              height: size.height)),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: pages,
            slideIconWidget: const Icon(Icons.arrow_back_ios),
            enableSideReveal: false,
            liquidController: controller,
            onPageChangeCallback: onPageChangeCallback,
          ),
          Positioned(
            bottom: 60.0,
            child: OutlinedButton(
              onPressed: () {
                int nextPage = controller.currentPage + 1;
                if (nextPage == pages.length) {
                    Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Welcome_screen()));
                }
                controller.animateToPage(page: nextPage);
              },
              style: ElevatedButton.styleFrom(
                side: const BorderSide(
                  color: Colors.green,
                ),
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(20),
                foregroundColor: Colors.white,
              ),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                    color: Colors.green, shape: BoxShape.circle),
                child: const Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const Welcome_screen())),
              // onPressed: () => Navigator.popUntil(context, (route) => false),
              child: const Text(
                "Skip",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            child: AnimatedSmoothIndicator(
              count: 3,
              activeIndex: controller.currentPage,
              effect: const WormEffect(
                activeDotColor: Colors.blue,
                dotHeight: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  onPageChangeCallback(int activePageIndex) {
    setState(() {
      currentPage = activePageIndex;
    });
  }
}

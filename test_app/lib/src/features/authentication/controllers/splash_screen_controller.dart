import 'package:get/get.dart';
import 'package:test_app/src/features/authentication/screens/onboarding/on_boarding_screen.dart';
import 'package:test_app/src/features/authentication/screens/welcome/home_screen.dart';

class SplashScreenController extends GetxController {
  static SplashScreenController get find => Get.find();
  
  RxBool animate = false.obs;
  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 1000));
      animate.value = true;
    await Future.delayed(const Duration(milliseconds: 2000));
    Get.to(() =>( const OnBoardingScreen()
    )
    );
    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => const WelcomeScreen()));
  
  }
}
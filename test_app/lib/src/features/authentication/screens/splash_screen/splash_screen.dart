// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:test_app/src/constants/colors.dart';
// import 'package:test_app/src/constants/image_strings.dart';
// import 'package:test_app/src/constants/sizes.dart';
// import 'package:test_app/src/constants/text_strings.dart';
// import 'package:test_app/src/features/authentication/controllers/splash_screen_controller.dart';
// import 'package:test_app/src/features/authentication/screens/welcome/home_screen.dart';

// class SplashScreen extends StatelessWidget {
//   SplashScreen({super.key});
//   final splashController = Get.put(SplashScreenController());

//   @override
//   Widget build(BuildContext context) {
//     splashController.startAnimation();
//     return Scaffold(
//         backgroundColor: Colors.white,
//         body: SafeArea(
//           child: Stack(
//             children: [
//               Obx(
//                 () => AnimatedPositioned(
//                   duration: const Duration(
//                       milliseconds:
//                           1600), // for splashController.animate.valued positioned
//                   left: splashController.animate.value ? tDefaultSize : -150,
//                   bottom: 750,
//                   child: Row(
//                     children: [
//                       Container(
//                         width: 50,
//                         height: 50,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(100),
//                             color: tPrimaryColor),
//                       ),
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       Container(
//                         width: 100,
//                         height: 50,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(100),
//                           color: tPrimaryColor,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Obx(
//                 () => AnimatedPositioned(
//                   duration: const Duration(milliseconds: 1600),
//                   left: splashController.animate.value ? tDefaultSize : -150,
//                   top: 100,
//                   child: AnimatedOpacity(
//                     duration: const Duration(milliseconds: 1600),
//                     opacity: splashController.animate.value ? 1 : 0,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           tAppName,
//                           style: Theme.of(context).textTheme.headlineMedium,
//                         ),
//                         Text(
//                           tAppTagLine,
//                           style: Theme.of(context).textTheme.headlineSmall,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Obx(
//                 () => AnimatedPositioned(
//                   duration: const Duration(milliseconds: 1000),
//                   bottom: splashController.animate.value ? 100 : 0,
//                   right: 0,
//                   child: AnimatedOpacity(
//                     duration: const Duration(milliseconds: 1000),
//                     opacity: splashController.animate.value ? 1 : 0,
//                     child: const Image(
//                       image: AssetImage(tSplashImage),
//                       width: 400,
//                       height: 600,
//                       alignment: Alignment.bottomCenter,
//                     ),
//                   ),
//                 ),
//               ),
//               Obx(
//                 () => AnimatedPositioned(
//                     duration: const Duration(milliseconds: 1600),
//                     right: splashController.animate.value ? tDefaultSize : -150,
//                     bottom: 40,
//                     child: Row(
//                       children: [
//                         Container(
//                           width: 50,
//                           height: 50,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(100),
//                               color: tPrimaryColor),
//                         ),
//                         const SizedBox(
//                           width: 10,
//                         ),
//                         Container(
//                           width: 100,
//                           height: 50,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(100),
//                             color: tPrimaryColor,
//                           ),
//                         ),
//                       ],
//                     )),
//               ),
//             ],
//           ),
//         ));
//   }
// }










import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/src/constants/colors.dart';
import 'package:test_app/src/constants/image_strings.dart';
import 'package:test_app/src/constants/sizes.dart';
import 'package:test_app/src/constants/text_strings.dart';
import 'package:test_app/src/features/authentication/controllers/splash_screen_controller.dart';
import 'package:test_app/src/features/authentication/screens/welcome/home_screen.dart';
import 'package:test_app/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:test_app/main.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final splashController = Get.put(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    splashController.startAnimation();
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              Obx(
                () => AnimatedPositioned(
                  duration: const Duration(
                      milliseconds:
                          1600), // for splashController.animate.valued positioned
                  left: splashController.animate.value ? tDefaultSize : -150,
                  bottom: 650,
                  // bottom: 750,
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: tPrimaryColor),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: tPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Obx(
                () => AnimatedPositioned(
                  duration: const Duration(milliseconds: 1600),
                  left: splashController.animate.value ? tDefaultSize : -150,
                  top: 100,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tAppName,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Text(
                          tAppTagLine,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                  ),
                ),
              ),
              Obx(
                () => AnimatedPositioned(
                  duration: const Duration(milliseconds: 1000),
                  bottom: splashController.animate.value ? 100 : 0,
                  right: 0,
                  child: const Image(
                      image: AssetImage(tSplashImage),
                      width: 400,
                      height: 600,
                      alignment: Alignment.bottomCenter,
                  ),
                ),
              ),
              Obx(
                () => AnimatedPositioned(
                    duration: const Duration(milliseconds: 1600),
                    right: splashController.animate.value ? tDefaultSize : -150,
                    bottom: 40,
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: tPrimaryColor),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 100,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: tPrimaryColor,
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ));
  }
}


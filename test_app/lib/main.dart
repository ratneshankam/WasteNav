import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import 'package:test_app/src/features/authentication/screens/splash_screen/splash_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:test_app/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:test_app/src/repository/authentication_repository/authentication_repository.dart';
import 'package:test_app/firebase_options.dart';
import 'package:test_app/src/utils/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp value) => Get.put((AuthenticationRepository())));
  //--Main App starts here
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      // defaultTransition: Transition.leftToRightWithFade,
      // transitionDuration: const Duration(milliseconds: 500),
      home: const Welcome_screen(),
    );
  }
}

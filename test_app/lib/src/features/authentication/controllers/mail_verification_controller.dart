import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/src/constants/text_strings.dart';
import 'package:test_app/src/repository/authentication_repository/authentication_repository.dart';

class MailVerificationController extends GetxController{
  late Timer _timer;
  @override
  void onInit(){
    super.onInit();
    sendVerificationEmail();
    setTimerForAutoRedirect();

  }

void sendVerificationEmail()async{
 try{
  await AuthenticationRepository.instance.sendEmailVerification();
 }catch(e){
  Helper.errorSnackBar(title: ohSnap, message: e.toString());
 }
}

void setTimerForAutoRedirect(){
  _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
    FirebaseAuth.instance.currentUser?.reload();
    final user = FirebaseAuth.instance.currentUser;
    if(user!.emailVerified){
      timer.cancel();
      AuthenticationRepository.instance.setInitialScreen(user);
    }
  });
}

void manuallyCheckEmailVerificationStatus(){
  FirebaseAuth.instance.currentUser?.reload();
  final user = FirebaseAuth.instance.currentUser;
  if(user!.emailVerified){
    AuthenticationRepository.instance.setInitialScreen(user);
  }
}
}

 

class Helper {
  static void errorSnackBar({required String title, required String message}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
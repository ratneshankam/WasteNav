import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/src/features/authentication/models/user_model.dart';
import 'package:test_app/src/features/authentication/screens/forgot%20Password/forgot_password_otp/otp_screen.dart';
import 'package:test_app/src/features/authentication/screens/welcome/home_screen.dart';
import 'package:test_app/src/repository/authentication_repository/authentication_repository.dart';
import 'package:test_app/src/repository/user_repository/user_repository.dart';

class SignUpController extends GetxController{
  static SignUpController get instance => Get.find();
  final email=TextEditingController();
  final password = TextEditingController();
  final fullName=TextEditingController();
  final phoneNo =TextEditingController();
  final address =TextEditingController();


  final userRepo = Get.put(UserRepository());

  
  
  void registerUser(String email, String password){
   
    String? error = AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password) as String?;
    if(error != null){
      Get.showSnackbar(GetSnackBar(message: error.toString()));
    }
  }

  void phoneAuthentication(String phoneNo){
    
try {
  AuthenticationRepository.instance.phoneAuthentication(phoneNo);
}  catch (e) {
   throw e.toString();
}
}
  Future<void> createUser(UserModel user) async {
    // Get.to(()=> const HomeScreen());

    print("inside createuser1");
    if((phoneNo.text != "" && email.text != "") || (phoneNo.text != "")) {
    await userRepo.createUser(user);
    phoneAuthentication(user.phoneNo);
      Get.to(()=> const OTPScreen());
    }
    else if(email.text == user.email) {
      final auth = AuthenticationRepository.instance;
    await AuthenticationRepository.instance.createUserWithEmailAndPassword(user.email, user.password);
    await UserRepository.instance.createUser(user);
    auth.setInitialScreen(auth.firebaseUser);
   
    }
  }
}
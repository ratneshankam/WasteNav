
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:test_app/src/constants/text_strings.dart';
import 'package:test_app/src/features/authentication/controllers/mail_verification_controller.dart';
import 'package:test_app/src/repository/authentication_repository/authentication_repository.dart';

class LoginController extends GetxController{
   static LoginController get instance => Get.find();



   ///TextField controllers to get data from TextFields
   
   final showPassword = false.obs;
   final email = TextEditingController();
   final username = TextEditingController();
   final password = TextEditingController();
   GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

   /// Loader
   final isLoading = false.obs;
   final isGoogleLoading = false.obs;
   

   /// [EmailAndPasswordLogin]
   Future<void> login()async{
    try{
      isLoading.value =false;
      if(!loginFormKey.currentState!.validate()){
        isLoading.value =false;
        return;

      }
      final auth = AuthenticationRepository.instance;
      await auth.loginWithEmailAndPassword(email.text.trim(), password.text.trim());
      auth.setInitialScreen(auth.firebaseUser);
    }catch (e){
      isLoading.value = false;
      Helper.errorSnackBar(title: ohSnap, message: e.toString());
    }
   }

   /// [GoogleSignInAuthentication]

   Future<void> googleSignIn() async {
    try{
      isGoogleLoading.value = true;
      final auth = AuthenticationRepository.instance;
      await auth.signInWithGoogle();
      isGoogleLoading.value = false;
      auth.setInitialScreen(auth.firebaseUser);
    }catch (e){
      print(e);
      isGoogleLoading.value = false;
      Helper.errorSnackBar(title: ohSnap, message: e.toString());
    }
   }
}

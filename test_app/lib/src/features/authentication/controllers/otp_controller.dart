import 'package:get/get.dart';
import 'package:test_app/src/features/authentication/screens/welcome/home_screen.dart';
import 'package:test_app/src/repository/authentication_repository/authentication_repository.dart';
import 'package:test_app/src/repository/user_repository/user_repository.dart';
class OTPCotroller extends GetxController{
  static OTPCotroller get instance => Get.find();

  void verifyOTP(String otp)async{
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll(const HomeScreen()):Get.back();
  }
}



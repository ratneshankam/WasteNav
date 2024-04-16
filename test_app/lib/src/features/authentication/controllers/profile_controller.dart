
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/src/features/authentication/models/user_model.dart';
import 'package:test_app/src/repository/authentication_repository/authentication_repository.dart';
import 'package:test_app/src/repository/user_repository/user_repository.dart';

class ProfileController extends GetxController{
  static ProfileController get instance => Get.find();

  //Repositories
  final _authRepo =Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  getUserData(){
    final phoneNO= _authRepo.firebaseUser!.phoneNumber;
    if(phoneNO != null){
      return _userRepo.getUserDetails(phoneNO);
    }else{
      Get.snackbar("Error", "Login to continue");
    }
  }

  updateRecord(UserModel user)async{

    await _userRepo.upadatUserRecord(user);
  }
}
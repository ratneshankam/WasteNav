
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/src/features/authentication/models/user_model.dart';

class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  Future<void> createUser(UserModel user)async{
    print("inside createUser in userRepo");
  await  _db.collection("Users").add(user.toJson()).whenComplete(
      () => Get.snackbar("Success", "You account has been created.",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.withOpacity(0.1),
      colorText: Colors.green,
      )
      
      )
       .catchError((error, stackTrace){
        Get.snackbar("Error", "Something went wrong. Try again.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,

        );
        print(error.toString());
      });
  }


  // fetch all user or user details

  Future<UserModel> getUserDetails(String phoneNo)async{
    final snapshot = await _db.collection("Users").where("Phone",isEqualTo: phoneNo).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }
  Future<List<UserModel>> allUser ()async{
    final snapshot = await _db.collection("Users").get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }

  Future<void> upadatUserRecord(UserModel user)async{
      await _db.collection("Users").doc(user.id).update(user.toJson());
  }
}
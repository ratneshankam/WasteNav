import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String fullName;
  final String email;
  final String phoneNo;
  final String password;
  final String address;

  const UserModel({
    this.id,
    required this.email,
    required this.password,
    required this.fullName,
    required this.phoneNo,
    required this.address,
  });

  toJson() {
    return {
      "FullName": fullName,
      "Email": email,
      "Phone": phoneNo,
      "Password": password,
      "Address": address
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {

    final data=document.data()!;
    return UserModel(
       id: document.id,
        email: data["Email"],
        password: data["Password"],
        fullName: data["FullName"],
        phoneNo: data["Phone"],
        address: data["Address"]);
  }
}

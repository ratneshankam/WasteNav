import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = "asdfafd fddf addf";
  String email = "xyz@gmail.com";
  String profilePictureUrl =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGf_8UZ3xLijdkOtv3qWnUpyknARbKMrcVJA&usqp=CAU";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('User Profile'),
            const SizedBox(
              height: 30,
            ),
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(profilePictureUrl),
            ),
            SizedBox(height: 20),
            Text('Name: ${name}'),
            Text('Email: ${email}'),
            // Add more user information widgets here
          ],
        ),
      ),
    );
  }
}

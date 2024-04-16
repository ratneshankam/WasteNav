import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:test_app/src/features/authentication/screens/welcome/database.dart';
import 'package:test_app/src/features/authentication/screens/welcome/login.dart';
import 'package:test_app/src/features/authentication/screens/welcome/sinup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:test_app/firebase_options.dart';
import 'package:test_app/src/repository/authentication_repository/authentication_repository.dart';

class Welcome_screen extends StatefulWidget {
  const Welcome_screen({super.key});

  @override
  State<Welcome_screen> createState() => _Welcome_screenState();
}

class _Welcome_screenState extends State<Welcome_screen> {
   @override
  void initState() {
    super.initState();
    database = createMyDatabase();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                height: 480,
                child: Image.asset(
                  "assets/images/signupImg.jpg",
                ),
              ),
              const Column(
                children: [
                  Text(
                    "Manage Your Waste ",
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w600,
                        fontSize: 35,
                        color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Please login to access your account & manage waste efficiently!",
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(
                height: 45,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                      style: const ButtonStyle(
                          fixedSize: MaterialStatePropertyAll(Size(120, 50))),
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  Login()));
                        });
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        )),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      )),
                  const SizedBox(
                    width: 50,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()));
                      },
                      style: const ButtonStyle(
                          fixedSize: MaterialStatePropertyAll(Size(120, 50)),
                          mouseCursor: MaterialStateMouseCursor.clickable),
                      child: Container(
                        decoration:
                            const BoxDecoration(shape: BoxShape.rectangle),
                        child: const Text("SignUp"),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

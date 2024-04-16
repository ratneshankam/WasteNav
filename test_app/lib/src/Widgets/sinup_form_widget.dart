import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as path;
import 'package:test_app/src/constants/sizes.dart';
import 'package:test_app/src/constants/text_strings.dart';
import 'package:test_app/src/features/authentication/controllers/signup_controller.dart';
import 'package:test_app/src/features/authentication/models/user_model.dart';
import 'package:test_app/src/features/authentication/screens/forgot%20Password/forgot_password_otp/otp_screen.dart';
import 'package:test_app/src/features/authentication/screens/welcome/database.dart';
import 'package:test_app/src/features/authentication/screens/welcome/home_screen.dart';
import 'package:test_app/src/features/authentication/screens/welcome/landing_page.dart';
import 'package:test_app/src/features/authentication/screens/welcome/login.dart';
import 'package:test_app/src/features/authentication/screens/welcome/sinup.dart';
import 'package:test_app/src/features/authentication/screens/welcome/welcome_screen.dart';

class SignUpFormWidget extends StatelessWidget {
  SignUpFormWidget({super.key});

  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(SignUpController());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.fullName,
              decoration: const InputDecoration(
                  label: Text(tFullName),
                  prefixIcon: Icon(Icons.person_outline_rounded)),
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              controller: controller.email,
              decoration: const InputDecoration(
                  label: Text(tEmail), prefixIcon: Icon(Icons.email_outlined)),
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              controller: controller.phoneNo,
              decoration: const InputDecoration(
                  label: Text(tPhoneNo), prefixIcon: Icon(Icons.phone)),
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              controller: controller.password,
              decoration: const InputDecoration(
                  label: Text(tPassword), prefixIcon: Icon(Icons.fingerprint)),
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              controller: controller.address,
              decoration: const InputDecoration(
                  label: Text(" Your Address"),
                  prefixIcon: Icon(Icons.home_outlined)),
            ),
            const SizedBox(height: tFormHeight - 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue),
                  foregroundColor: MaterialStatePropertyAll(Colors.white),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    //email and password authentication
                    // SignUpController.instance.registerUser(controller.email.text.trim(), controller.password.text.trim());

                    //for phone Authentication
                    // SignUpController.instance.phoneAuthentication(controller.phoneNo.text.trim());

                    final user = UserModel(
                      email: controller.email.text.trim(),
                      password: controller.password.text.trim(),
                      fullName: controller.fullName.text.trim(),
                      phoneNo: controller.phoneNo.text.trim(),
                      address: controller.address.text.trim(),
                    );
                    SignUpController.instance.createUser(user);

                    // Get.to(()=> const OTPScreen());
                    Get.to(() =>  Login());
                  }
                  submit(context);
                },
                child: Text(tSignup.toUpperCase()),
              ),
            )
          ],
        ),
      ),
    );
  }

  // for local database submit method
   void submit(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final phoneNo = controller.phoneNo.text.trim();
      if (phoneNo.length < 10) {
        showSignInSnackBar(
            context, "Please Enter a Valid 10 digit Phone Number with countryCode", Colors.red);
      } else {
        SingleChildModalUsersData newUser = SingleChildModalUsersData(
            name: controller.fullName.text.trim(),
            email: controller.email.text.trim(),
            phone: controller.phoneNo.text.trim(),
            password: controller.password.text.trim(),
            address: controller.address.text.trim(),
            );
        final existingUsers = await fetchUserData();

        bool userExists = false;
        for (var user in existingUsers) {
          if (user.email == newUser.email) {
            userExists = true;
            break;
          }
        }

        if (userExists) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('User already exists!'),
              backgroundColor: Colors.red,
            ),
          );
        } else {
          await insertUserData(newUser);

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('User registered successfully!'),
              backgroundColor: Colors.green,
            ),
          );
          print(database);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  Login()),
          );
        }
      }
    }
  }

   void showSignInSnackBar(BuildContext context, String text, Color color) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(text),
      backgroundColor: color,
      duration: const Duration(seconds: 2),
    );
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignUpScreen()),
      );
    });
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

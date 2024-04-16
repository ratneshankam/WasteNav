import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:test_app/src/Widgets/sign_in_footer_widget.dart';
import 'package:test_app/src/constants/sizes.dart';
import 'package:test_app/src/constants/text_strings.dart';
import 'package:test_app/src/features/authentication/controllers/login_controller.dart';
import 'package:test_app/src/features/authentication/screens/welcome/database.dart';
import 'package:test_app/src/features/authentication/screens/welcome/home_screen.dart';
import 'package:test_app/src/features/authentication/screens/welcome/landing_page.dart';
// import 'package:test_app/src/features/authentication/screens/welcome/welcome_screen.dart';

import '../forgot Password/forgot_password_options/forgot_pass_btn_widget.dart';

class Login extends StatelessWidget {
  Login({super.key});

    final controller = Get.put(LoginController());
  List<SingleChildModalUsersData> data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        // backgroundColor: Colors.white,
        // resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            decoration: const BoxDecoration(
                // color: Colors.white
                ),
            child: Column(
              children: [
                const Text(
                  "Welcome Back !!",
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  "assets/images/loginImg.jpg",
                  height: 220,
                ),
                const SizedBox(height: 20),
                Form(
                    key: controller.loginFormKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: controller.email,
                          obscureText: false,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.person_2_outlined),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            labelText: 'Username',
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: controller.password,
                          validator: (value) {
                            if (value!.isEmpty) return 'Enter your password';
                            return null;
                          },
                          obscureText:
                              controller.showPassword.value ? false : true,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock_outline_rounded),
                            suffixIcon: IconButton(
                              icon: controller.showPassword.value
                                  ? const Icon(LineAwesomeIcons.eye)
                                  : const Icon(LineAwesomeIcons.eye_slash),
                              onPressed: () => controller.showPassword.value =
                                  !controller.showPassword.value,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            labelText: 'Password',
                          ),
                        ),
                      ],
                    )),
                const SizedBox(height: tFormHeight - 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {
                        ForgetPasswordScreen.buildShowModalBottomSheet(context);
                      },
                      child: const Text(tForgetPassword)),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      submitForm(context);
                    },
                    child: Text(tLogin.toUpperCase()),
                  ),
                  // ElevatedButton(
                  //     onPressed: () {
                  //       setState(() {
                  //         Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //                 builder: (context) => const HomeScreen()));
                  //       });
                  //     },
                  //     child: const Text(
                  //       "Login",
                  //       style:
                  //           TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                  //     )),
                ),
                const LoginFooterWidget(),
              ],
            ),
          ),
        ));
  }
  void submitForm(BuildContext context) async {
    if (controller.loginFormKey.currentState!.validate()) {
      data = await fetchUserData();
      bool flag = false;

      for (int i = 0; i < data.length; i++) {
        if (data[i].email == controller.email.text.trim() &&
            data[i].password == controller.password.text) {
          flag = true;
          break;
        }
      }

      if (flag) {
        _showSuccessSnackbar(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.only(top: 70, left: 20, right: 20, bottom: 20),
            content: Text('Invalid Login Credentials',
                style: TextStyle(color: Colors.white)),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  void _showSuccessSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(top: 70, left: 20, right: 20, bottom: 20),
        content: Text('Logged in Successfully',
            style: TextStyle(color: Colors.white)),
        duration: Duration(seconds: 2),
      ),
    );

    Future.delayed(const Duration(seconds: 1), () {
      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()));
    });
  }
}

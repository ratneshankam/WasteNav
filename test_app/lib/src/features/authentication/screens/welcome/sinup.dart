import 'package:flutter/material.dart';
import 'package:test_app/src/Widgets/formHeaderWidget.dart';
import 'package:test_app/src/Widgets/signup_footer_widget.dart';
import 'package:test_app/src/Widgets/sinup_form_widget.dart';
import 'package:test_app/src/constants/image_strings.dart';
import 'package:test_app/src/constants/text_strings.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(sinupscreenImage),
                      alignment: Alignment.topCenter)),
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child:  Column(
                children: [
                  // FormHeaderWidget(
                  //   title: "Hello,",
                  //   image: sinupscreenImage,
                  //   imageHeight: .35,
                  //   subTitle: signupsubTitle,
                  // ),

                  Text(
                    "👋Hello",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    signupsubTitle,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 200,
                  ),
                  SignUpFormWidget(),
                  SignUpFooterWidget()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:test_app/src/Widgets/sinup_form_widget.dart';
import 'package:test_app/src/constants/image_strings.dart';
import 'package:test_app/src/constants/text_strings.dart';
import 'package:test_app/src/features/authentication/screens/welcome/login.dart';

class SignUpFooterWidget extends StatelessWidget {
  const SignUpFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("OR"),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: const Image(
              image: AssetImage(google),
              width: 20.0,
            ),
            label: Text(
              tSignInWithGoogle.toUpperCase(),
              style: const TextStyle(color: Color(0xFF2196F3)),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) =>  Login()));
          },
          child: Text.rich(TextSpan(children: [
            TextSpan(
              text: tAlreadyHaveAnAccount,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            TextSpan(
              text: tLogin.toUpperCase(),
              style: const TextStyle(color: Color(0xFF2196F3)),
            )
          ])),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:test_app/src/constants/sizes.dart';
import 'package:test_app/src/constants/text_strings.dart';
import 'package:test_app/src/features/authentication/controllers/otp_controller.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var otp;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              otpTitle,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 80.0),
            ),
            Text(otpSubTitle.toUpperCase(),
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 40.0),
            const Text("$otpMessage support@codingwitht.com",
                textAlign: TextAlign.center),
            const SizedBox(height: 20.0),
           Expanded(
              child: OtpTextField(
                  mainAxisAlignment: MainAxisAlignment.center,
                  numberOfFields: 6,
                  fillColor: Colors.black.withOpacity(0.1),
                  filled: true,
                  onSubmit: (code) {
                    otp = code;
                    Get.put((OTPCotroller()));
                    OTPCotroller.instance.verifyOTP(otp);
                  }),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Get.put((OTPCotroller()));
                    OTPCotroller.instance.verifyOTP(otp);
                  },
                  child: const Text(tNext)),
            ),
          ],
        ),
      ),
    );
  }
}

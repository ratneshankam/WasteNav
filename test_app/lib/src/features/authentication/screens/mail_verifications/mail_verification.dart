import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:test_app/src/constants/sizes.dart';
import 'package:test_app/src/constants/text_strings.dart';
import 'package:test_app/src/features/authentication/controllers/mail_verification_controller.dart';
import 'package:test_app/src/repository/authentication_repository/authentication_repository.dart';

class MailVerification extends StatelessWidget {
  const MailVerification({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MailVerificationController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              top: defaultSpace * 5, left: defaultSpace, right: defaultSpace, bottom:defaultSpace * 2),
          child: Column (
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(LineAwesomeIcons.envelope_open, size: 100),
              const SizedBox(height: defaultSpace * 2),
              Text(tEmailVerificationTitle.tr, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: defaultSpace),
              Text(
                tEmailVerificationSubTitle.tr,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
              ),
              const SizedBox(height: defaultSpace * 2),
              SizedBox(
                    width: 200,
                    child: OutlinedButton(child: Text(tContinue.tr), onPressed: () => controller.manuallyCheckEmailVerificationStatus())
                    ), 
              const SizedBox(height: defaultSpace * 2),
              TextButton(
                onPressed: () => controller.sendVerificationEmail(),
                child: Text(tResendEmailLink.tr),
              ), 
              TextButton(
                onPressed: () => AuthenticationRepository.instance.logout(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(LineAwesomeIcons.alternate_long_arrow_left),
                    const SizedBox (width: 5),

                    Text(tBackToLogin.tr.toLowerCase()),

                    ]),
                ) , 

 
              ]),
            )
        )
      ); 
  }
}
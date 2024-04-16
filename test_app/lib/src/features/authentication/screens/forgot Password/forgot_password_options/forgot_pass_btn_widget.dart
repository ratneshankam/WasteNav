import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/src/constants/sizes.dart';
import 'package:test_app/src/constants/text_strings.dart';
import 'package:test_app/src/features/authentication/screens/forgot%20Password/forgot_pass_mail/forget_password_mail_screen.dart';
import 'package:test_app/src/features/authentication/screens/forgot%20Password/forgot_password_options/bottom_sheet_button_widget.dart';

class ForgetPasswordScreen {
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      builder: (context) => Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(forgotPasswordTitle,
                style: Theme.of(context).textTheme.displayMedium),
            Text(forgotPasswordSubTitle,
                style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 30.0),
            ForgetPasswordBtnWidget(
              onTap: () {
                Navigator.pop(context);
                Get.to(() => const ForgetPasswordMailScreen());
              },
              title: tEmail,
              subTitle: resetViaEmail,
              btnIcon: Icons.mail_outline_rounded,
            ),
            const SizedBox(height: 20.0),
            ForgetPasswordBtnWidget(
              onTap: () {},
              title: tPhoneNo,
              subTitle: resetViaPhone,
              btnIcon: Icons.mobile_friendly_rounded,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:firebase_app/src/constants/sizes.dart';
import 'package:firebase_app/src/constants/text_strings.dart';
import 'package:firebase_app/src/features/authentication/screens/forget_password/forget_password_mails/forget_password_mail.dart';
import 'package:firebase_app/src/features/authentication/screens/forget_password/forget_password_options/forget_password_btn_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FogetPasswordScreen {
  static Future<dynamic> BuildShowmodalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.all(tDefaulSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tForgetPasswordTitle,
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              tForgetPasswordSubTitle,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            const SizedBox(
              height: 30,
            ),
            ForgetPasswordBtnWidget(
              btnIcon: Icons.email_outlined,
              title: tEmail,
              subTitle: tResetViaEMail,
              onTap: () {
                Navigator.of(context).pushNamed('$ForgetPasswordMailScreen');
                //Get.to(() => const ForgetPasswordMailScreen());
                },
            ),
            const SizedBox(
              height: 20.0,
            ),
            ForgetPasswordBtnWidget(
              btnIcon: Icons.mobile_friendly_rounded,
              title: tPhoneNo,
              subTitle: tResetViaPhone,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

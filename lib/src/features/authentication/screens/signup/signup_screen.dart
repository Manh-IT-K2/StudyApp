import 'package:firebase_app/src/common_widgets/form/form_footer_widget.dart';
import 'package:firebase_app/src/common_widgets/form/form_hearder_widget.dart';
import 'package:firebase_app/src/constants/image_string.dart';
import 'package:firebase_app/src/constants/sizes.dart';
import 'package:firebase_app/src/constants/text_strings.dart';
import 'package:firebase_app/src/features/authentication/screens/signup/signup_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_app/src/features/authentication/screens/login/login_screen.dart';

class SignUpSceen extends StatelessWidget {
  const SignUpSceen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaulSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              /* -- section 1 -- */
              FormHeaderWidget(
                crossAxisAlignment: CrossAxisAlignment.start,
                  image: tHeaderImage, title: tSignUpTitle, subtitle: tSignUpSubTitle, height: 0.2,),
              /* - end -- */

              /* -- section 2 [form] -- */
              SignUpForm(),
              /* - end -- */

              FormFooterWidget(image: tIconGoogle, textIcon: tSignInWithGoogle, text: tLogin, page: 'LoginSceen'),
            ],
          ),
        ),
      ),
    );
  }
}

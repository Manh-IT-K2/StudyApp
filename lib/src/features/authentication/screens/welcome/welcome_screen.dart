import 'package:firebase_app/src/common_widgets/fade_in_animation/animation_design.dart';
import 'package:firebase_app/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:firebase_app/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:firebase_app/src/constants/colors.dart';
import 'package:firebase_app/src/constants/image_string.dart';
import 'package:firebase_app/src/constants/sizes.dart';
import 'package:firebase_app/src/constants/text_strings.dart';
import 'package:firebase_app/src/features/authentication/screens/login/login_screen.dart';
import 'package:firebase_app/src/features/authentication/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.startAnimation();
    var mediaQuery = MediaQuery.of(context);
    var size = mediaQuery.size;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? tSecondaryColor : tPrimaryColor,
      body: Stack(
        children: [
          TFadeInAnimation(
            durationInMs: 1200,
            animatePosition: TAnimatePosition(
                bottomAfter: 0,
                bottomBefore: -120,
                topAfter: 0,
                topBefore: 0,
                leftAfter: 0,
                leftBefore: 0,
                rightAfter: 0,
                rightBefore: 0),
            child: Container(
              padding: const EdgeInsets.all(tDefaulSize),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(
                    image: const AssetImage(tWelcomeImage),
                    height: size.height * 0.6,
                  ),
                  Column(
                    children: [
                      Text(
                        tWelcomeTitle,
                        style: Theme.of(context).textTheme.headline3,
                        textAlign: TextAlign.center,
                      ),
                      Text(tWelcomeSubTitle,
                          style: Theme.of(context).textTheme.bodyText1,
                          textAlign: TextAlign.center),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            Get.to(() => const LoginSceen());
                            //Navigator.of(context).pushNamed('$LoginSceen');
                          },
                          child: Text(
                            "LogIn".toUpperCase(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Get.to(() => const SignUpSceen());
                           //Navigator.of(context).pushNamed('$SignUpSceen');
                          },
                          child: Text(
                            "SignUp".toUpperCase(),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

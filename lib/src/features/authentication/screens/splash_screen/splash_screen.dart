import 'package:firebase_app/src/common_widgets/fade_in_animation/animation_design.dart';
import 'package:firebase_app/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:firebase_app/src/constants/colors.dart';
import 'package:firebase_app/src/constants/image_string.dart';
import 'package:firebase_app/src/constants/sizes.dart';
import 'package:firebase_app/src/constants/text_strings.dart';
import 'package:firebase_app/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.startSplashAnimation();
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            TFadeInAnimation(
                durationInMs: 1600,
                animatePosition: TAnimatePosition(
                  topAfter: 0,
                  topBefore: -30,
                  leftAfter: 0,
                  leftBefore: -30,
                ),
                child: const Image(image: AssetImage(tSplashTopIcon),height: 100,width: 100,)),
            TFadeInAnimation(
              durationInMs: 2000,
              animatePosition: TAnimatePosition(
                topAfter: 90,
                topBefore: 90,
                leftAfter: tDefaulSize,
                leftBefore: -80,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(tAppName,
                      style: Theme.of(context).textTheme.headline1,),
                  Text(
                    TAppTagline,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ],
              ),
            ),
            TFadeInAnimation(
              durationInMs: 2400,
              animatePosition:
                  TAnimatePosition(bottomAfter: 60, bottomBefore: 0),
              child: Image.asset(
                tSplashImage,
              ),
            ),
            TFadeInAnimation(
              durationInMs: 2400,
              animatePosition: TAnimatePosition(
                  bottomAfter: 30,
                  bottomBefore: 0,
                  rightAfter: tDefaulSize,
                  rightBefore: tDefaulSize),
              child: Container(
                width: tSplashContainerSize,
                height: tSplashContainerSize,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: tPrimaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:firebase_app/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:get/get.dart';

class FadeInAnimationController extends GetxController{

  static FadeInAnimationController get find => Get.find();
  
  RxBool animate = false.obs;

  Future startSplashAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
    await Future.delayed(const Duration(milliseconds: 4000));
    animate.value = false;
    await Future.delayed(const Duration(milliseconds: 3000));
    Get.off(() => const Welcome());
  
  }
  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
  }
}

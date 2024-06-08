import 'package:firebase_app/src/constants/colors.dart';
import 'package:firebase_app/src/constants/image_string.dart';
import 'package:firebase_app/src/constants/text_strings.dart';
import 'package:firebase_app/src/features/authentication/models/model_on_boarding.dart';
import 'package:firebase_app/src/features/authentication/screens/on_boarding/on_boarding_page_widget.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class OnBoardingController extends GetxController {
  final controller = LiquidController();
  RxInt currentPage = 0.obs;

  final pages = [
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: tOnboardingIamge1,
        title: tOnboardingTitle1,
        subTitle: tOnboardingSubTitle1,
        counterText: tOnboardingCounter1,
        bgColor: tOnBoardingPage1color,
      ),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: tOnboardingIamge2,
        title: tOnboardingTitle2,
        subTitle: tOnboardingSubTitle2,
        counterText: tOnboardingCounter2,
        bgColor: tOnBoardingPage2color,
      ),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: tOnboardingIamge3,
        title: tOnboardingTitle3,
        subTitle: tOnboardingSubTitle3,
        counterText: tOnboardingCounter3,
        bgColor: tOnBoardingPage3color,
      ),
    ),
  ];

  skip() => (controller.jumpToPage(page: 2));
  animatedToNextSlide() {
    int nextPage = controller.currentPage + 1;
    controller.animateToPage(page: nextPage);
  }

  onPageChangeCallback(int activePageIndex) {
    currentPage.value = activePageIndex;
  }
}

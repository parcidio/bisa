import 'package:dona/applications/authentication/controllers.onboarding/onboarding.controller.dart';
import 'package:dona/presentation/authentication/onboarding/widgets/onboarding_dot_naviagetion.dart';
import 'package:dona/presentation/authentication/onboarding/widgets/onboarding_next_button.dart';
import 'package:dona/presentation/authentication/onboarding/widgets/onboarding_page.dart';
import 'package:dona/presentation/authentication/onboarding/widgets/onboarding_skip.dart';
import 'package:dona/utils/constants/image_strings.dart';
import 'package:dona/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());

    return Scaffold(
        body: Stack(children: [
      // Horizontally scrollable view

      PageView(
        controller: controller.pageController,
        onPageChanged: controller.updatePageIndicator,
        children: const [
          OnBoardingPage(
              image: AppImages.onBoardingImage1,
              title: AppTexts.onBoardingTitle1,
              subTitle: AppTexts.onBoardingSubTitle1),
          OnBoardingPage(
              image: AppImages.onBoardingImage2,
              title: AppTexts.onBoardingTitle2,
              subTitle: AppTexts.onBoardingSubTitle2),
          OnBoardingPage(
              image: AppImages.onBoardingImage3,
              title: AppTexts.onBoardingTitle3,
              subTitle: AppTexts.onBoardingSubTitle3),
          OnBoardingPage(
              image: AppImages.onBoardingImage4,
              title: AppTexts.onBoardingTitle4,
              subTitle: AppTexts.onBoardingSubTitle4),
          OnBoardingPage(
              image: AppImages.onBoardingImage5,
              title: AppTexts.onBoardingTitle5,
              subTitle: AppTexts.onBoardingSubTitle5)
        ],
      ),
      // Skipp button
      const OnBoardingSkip(),
      // Smooth Page Indicator
      const OnBoardingDotNativation(),
      // Circular Next Button
      const OnBoardingNextButton()
    ]));
  }
}

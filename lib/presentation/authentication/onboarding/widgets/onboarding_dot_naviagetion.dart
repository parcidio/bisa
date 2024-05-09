import 'package:dona/applications/authentication/controllers.onboarding/onboarding.controller.dart';
import 'package:dona/utils/constants/colors.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:dona/utils/device/device._utility.dart';
import 'package:dona/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNativation extends StatelessWidget {
  const OnBoardingDotNativation({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;
    final isDarkMode = AppHelperFuncions.isDarkMode(context);
    return Positioned(
      bottom: AppDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: AppSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 5,
        effect: ColorTransitionEffect(
            activeDotColor: isDarkMode ? AppColors.light : AppColors.dark,
            dotHeight: 10.0),
      ),
    );
  }
}

import 'package:dona/applications/authentication/controllers.onboarding/onboarding.controller.dart';
import 'package:dona/utils/constants/colors.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:dona/utils/device/device._utility.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: AppDeviceUtils.getBottomNavigationBarHeight(),
        right: AppSizes.defaultSpace,
        child: ElevatedButton(
          onPressed: () => OnboardingController.instance.nextPage(),
          style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: AppColors.buttonPrimary),
          child: const Icon(Iconsax.arrow_right_3),
        ));
  }
}

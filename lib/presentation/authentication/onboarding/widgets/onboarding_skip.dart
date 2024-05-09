import 'package:dona/applications/authentication/controllers.onboarding/onboarding.controller.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:dona/utils/device/device._utility.dart';
import 'package:flutter/material.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: AppDeviceUtils.getAppBarHeight(),
        right: AppSizes.defaultSpace,
        child: TextButton(
          onPressed: () => OnboardingController.instance.skipPage(),
          child: const Text('Skip'),
        ));
  }
}

import 'package:dona/utils/constants/colors.dart';
import 'package:dona/utils/constants/image_strings.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(AppSizes.spaceBetweenItems),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.grey),
                borderRadius: BorderRadius.circular(AppSizes.sm)),
            child: SvgPicture.asset(
              AppImages.googleLogo,
              height: AppSizes.iconSm,
              width: AppSizes.iconSm,
            ),
          ),
        ),
        const SizedBox(
          width: AppSizes.spaceBetweenItems,
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(AppSizes.spaceBetweenItems),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.grey),
                borderRadius: BorderRadius.circular(AppSizes.sm)),
            child: SvgPicture.asset(
              AppImages.facebookLogo,
              height: AppSizes.iconSm,
              width: AppSizes.iconSm,
            ),
          ),
        ),
      ],
    );
  }
}

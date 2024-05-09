import 'package:dona/common/widgets/icons/circular_icon.dart';
import 'package:dona/utils/constants/colors.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:dona/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AppBottomAddToCart extends StatelessWidget {
  const AppBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = AppHelperFuncions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.defaultSpace,
          vertical: AppSizes.defaultSpace / 2),
      decoration: BoxDecoration(
          color: isDark ? AppColors.darkerGrey : AppColors.light,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(AppSizes.cardRadiusLg),
            topRight: Radius.circular(AppSizes.cardRadiusLg),
          )),
      child: Row(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppCircularIcon(
              onPressed: () {},
              icon: Iconsax.minus,
              height: 40,
              width: 40,
              color: AppColors.white,
              backgroundColor: AppColors.darkGrey,
            ),
            const SizedBox(
              height: AppSizes.spaceBetweenItems,
            ),
            Text('2', style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(
              height: AppSizes.spaceBetweenItems,
            ),
            AppCircularIcon(
              onPressed: () {},
              icon: Iconsax.add,
              height: 40,
              width: 40,
              color: AppColors.black,
              backgroundColor: AppColors.darkGrey,
            ),
          ],
        ),
        ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(AppSizes.md),
                backgroundColor: AppColors.black,
                side: const BorderSide(color: AppColors.black)),
            child: const Text('Add to cart'))
      ]),
    );
  }
}

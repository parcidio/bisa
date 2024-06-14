import 'package:dona/common/widgets/icons/circular_icon.dart';
import 'package:dona/utils/constants/colors.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:dona/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
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
        color: isDark ? AppColors.dark : AppColors.light,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              AppCircularIcon(
                onPressed: () {},
                icon: CupertinoIcons.minus,
                height: 35,
                width: 35,
                size: AppSizes.iconSm,
                color: AppColors.white,
                backgroundColor: AppColors.primary,
              ),
              const SizedBox(
                width: AppSizes.spaceBetweenItems,
              ),
              Text('2', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(
                width: AppSizes.spaceBetweenItems,
              ),
              AppCircularIcon(
                onPressed: () {},
                icon: CupertinoIcons.add,
                height: 35,
                width: 35,
                size: AppSizes.iconSm,
                color: AppColors.white,
                backgroundColor: AppColors.primary,
              ),
            ],
          ),
          SizedBox(width: AppSizes.spaceBetweenItems),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(AppSizes.sm),
                backgroundColor: AppColors.primary,
              ),
              child: Row(
                children: [
                  Text(
                    'Adicionar',
                  ),
                  SizedBox(width: AppSizes.spaceBetweenItems),
                  Icon(
                    CupertinoIcons.bag,
                  ),
                ],
              ))
        ],
      ),
    );
  }
}

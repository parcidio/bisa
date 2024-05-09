import 'package:dona/common/widgets/appbar/appbar.dart';
import 'package:dona/common/widgets/custom_shapes/curved_edges/curved_egdes_widget.dart';
import 'package:dona/common/widgets/icons/circular_icon.dart';
import 'package:dona/common/widgets/images/rounded_image.dart';
import 'package:dona/utils/constants/colors.dart';
import 'package:dona/utils/constants/image_strings.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:dona/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AppProductImageSlider extends StatelessWidget {
  const AppProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = AppHelperFuncions.isDarkMode(context);

    return AppCurvedWidget(
      child: Container(
        color: isDark ? AppColors.darkGrey : AppColors.light,
        child: Stack(
          children: [
            // main image
            const SizedBox(
              child: Padding(
                padding: EdgeInsets.all(AppSizes.productImageRadius * 3),
                child: Center(
                  child: Image(
                    image: AssetImage(AppImages.productImage1),
                  ),
                ),
              ),
            ),
            // image slider
            Positioned(
              right: 0,
              bottom: 30,
              left: AppSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    separatorBuilder: (_, __) => const SizedBox(
                          width: AppSizes.spaceBetweenItems,
                        ),
                    itemCount: 10,
                    itemBuilder: (_, index) => AppRoundedImage(
                        width: 80,
                        backgroundColor:
                            isDark ? AppColors.dark : AppColors.white,
                        border: Border.all(color: AppColors.dark),
                        padding: const EdgeInsets.all(AppSizes.sm),
                        imageUrl: AppImages.productImage2)),
              ),
            ),
            AppAppBar(
              showBackArrow: true,
              actions: [
                AppCircularIcon(
                  onPressed: () {},
                  icon: Iconsax.heart5,
                  color: Colors.red,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

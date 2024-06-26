import 'package:dona/common/styles/shadows_styles.dart';
import 'package:dona/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:dona/common/widgets/icons/circular_icon.dart';
import 'package:dona/common/widgets/images/rounded_image.dart';
import 'package:dona/common/widgets/product/product_card/product_price_text.dart';
import 'package:dona/common/widgets/text/brand_title_text_with_vertical_icon.dart';
import 'package:dona/common/widgets/text/product_title_text.dart';
import 'package:dona/presentation/shop/product_details/product_details.dart';
import 'package:dona/utils/constants/colors.dart';
import 'package:dona/utils/constants/image_strings.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:dona/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AppProductCardVertical extends StatelessWidget {
  const AppProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = AppHelperFuncions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => const AppProductDetails()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            boxShadow: [AppShadowstyle.verticalProductShadow],
            borderRadius: BorderRadius.circular(AppSizes.productImageRadius),
            color: isDark ? AppColors.darkGrey : AppColors.white),
        child: Column(children: [
          // Thumbnail
          AppRoundedContainer(
            height: 180,
            padding: const EdgeInsets.all(AppSizes.sm),
            backgroundColor: isDark ? AppColors.dark : AppColors.white,
            child: Stack(
              children: [
                // product image
                const AppRoundedImage(
                  width: 180,
                  imageUrl: AppImages.productImage3,
                  applyImageRadius: true,
                ),
                // sales tag
                Positioned(
                  top: 8,
                  left: 8,
                  child: AppRoundedContainer(
                    radius: AppSizes.sm,
                    backgroundColor: AppColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.sm, vertical: AppSizes.xs),
                    child: Row(
                      children: [
                        Text(
                          '2%',
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .apply(color: AppColors.black),
                        ),
                        const Icon(
                          CupertinoIcons.arrow_down_right,
                          size: AppSizes.sm,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: AppCircularIcon(
                    onPressed: () {},
                    icon: CupertinoIcons.add,
                    height: 32,
                    width: 32,
                    size: AppSizes.iconSm,
                    color: AppColors.white,
                    backgroundColor: AppColors.primary,
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: AppCircularIcon(
                    height: 30,
                    width: 30,
                    onPressed: () {},
                    icon: Iconsax.heart5,
                    color: Colors.red,
                    size: 10,
                  ),
                )
              ],
            ),
          ),
          // Details
          const SizedBox(
            height: AppSizes.spaceBetweenItems / 2,
          ),
          Padding(
            padding: const EdgeInsets.only(left: AppSizes.sm),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AppProductTitleText(
                    title: "Pepsi can set",
                    isSmallSize: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: AppSizes.spaceBetweenItems),
                    child: Row(children: [
                      const Icon(Icons.star,
                          color: AppColors.secondary, size: AppSizes.iconSm),
                      const SizedBox(
                        height: AppSizes.xs,
                      ),
                      Text(
                        "3,2",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ]),
                  )
                ],
              ),
              const SizedBox(
                height: AppSizes.spaceBetweenItems / 8,
              ),
              const AppBrandTextTitleWithVerticalIcon(
                title: 'Golf 2',
              ),
            ]),
          ),
          // const Spacer(),
          const SizedBox(
            height: AppSizes.spaceBetweenItems / 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.sm),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AppProductPriceText(
                  price: 500.30,
                  isLarge: true,
                  priceWas: 600.50,
                ),
                // Positioned(
                //   child: AppCircularIcon(
                //     onPressed: () {},
                //     icon: CupertinoIcons.add,
                //     height: 32,
                //     width: 32,
                //     size: AppSizes.iconSm,
                //     color: AppColors.white,
                //     backgroundColor: AppColors.primary,
                //   ),
                // ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

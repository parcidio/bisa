  import 'package:dona/common/styles/shadows_styles.dart';
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
  import 'package:flutter/widgets.dart';
  import 'package:get/get.dart';

  import '../../icons/circular_icon.dart';

  class AppProductCardHorizontal extends StatelessWidget {
    const AppProductCardHorizontal({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      final isDark = AppHelperFuncions.isDarkMode(context);
      return GestureDetector(
        onTap: () => Get.to(() => const AppProductDetails()),
        child: Container(
          height: 150,
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            boxShadow: [AppShadowstyle.verticalProductShadow],
            borderRadius: BorderRadius.circular(AppSizes.productImageRadius),
            color: isDark ? AppColors.darkGrey : AppColors.white,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Thumbnail
              AppRoundedImage(
                width: 120,
                imageUrl: AppImages.productImage3,
                applyImageRadius: true,
              ),
              // const SizedBox(width: 12),
              // Details
              Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     const AppProductTitleText(
                  //       title: "Pepsi can set",
                  //       isSmallSize: true,
                  //     ),
                  //     const SizedBox(height: 4),
                  //     const AppBrandTextTitleWithVerticalIcon(
                  //       title: 'Nike',
                  //     ),
                  //   ],
                  // ),
                   Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AppProductPriceText(
                        price: '500',
                        cents: '04',
                        isLarge: true,
                        priceWas: '600',
                      ),
                      Row(
                        children: [
                          AppCircularIcon(
                            onPressed: () {},
                            icon: CupertinoIcons.minus,
                            height: 40,
                            width: 40,
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
                        height: 40,
                        width: 40,
                        color: AppColors.white,
                            backgroundColor: AppColors.primary,
                      ),
                    ],
                  ),
                ],
              ),
                        ])],
          ),
        ),
      );
    }
  }
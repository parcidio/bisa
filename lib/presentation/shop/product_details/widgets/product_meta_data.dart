import 'package:dona/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:dona/common/widgets/images/circular_image.dart';
import 'package:dona/common/widgets/product/product_card/product_price_text.dart';
import 'package:dona/common/widgets/text/brand_text_tile.dart';
import 'package:dona/common/widgets/text/brand_title_text_with_vertical_icon.dart';
import 'package:dona/common/widgets/text/product_title_text.dart';
import 'package:dona/utils/constants/colors.dart';
import 'package:dona/utils/constants/enums.dart';
import 'package:dona/utils/constants/image_strings.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:dona/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppProductMetaData extends StatelessWidget {
  const AppProductMetaData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = AppHelperFuncions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Price and Promotion
        Row(
          children: [
            AppRoundedContainer(
              radius: AppSizes.sm,
              backgroundColor: AppColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.sm, vertical: AppSizes.xs),
              child: Text(
                '25%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: AppColors.black),
              ),
            ),
            const SizedBox(
              width: AppSizes.spaceBetweenItems,
            ),
            const AppProductPriceText(
              price: '150',
              isLarge: true,
              priceWas: '200',
            ),
          ],
        ),
        const SizedBox(
          height: AppSizes.spaceBetweenItems / 1.5,
        ),
        //Title
        AppProductTitleText(title: "Red Nike sneakers"),
        const SizedBox(
          height: AppSizes.spaceBetweenItems / 1.5,
        ),
        //Stock status
        Row(
          children: [
            AppProductTitleText(title: "Status"),
            const SizedBox(
              width: AppSizes.spaceBetweenItems,
            ),
            Text('In stock', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(
          height: AppSizes.spaceBetweenItems / 1.5,
        ),
        //Brand

        Row(
          children: [
            AppCircularImage(
              image: AppImages.nike,
              width: 60,
              height: 60,
              isSvg: true,
              overlayColor: isDark ? AppColors.white : AppColors.black,
            ),
          ],
        ),
        const AppBrandTextTitleWithVerticalIcon(
          title: 'Nike',
          brandTextSize: TextSizes.medium,
        ),
      ],
    );
  }
}

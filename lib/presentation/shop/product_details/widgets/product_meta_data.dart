import 'package:dona/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:dona/common/widgets/product/product_card/product_price_text.dart';
import 'package:dona/common/widgets/text/brand_title_text_with_vertical_icon.dart';
import 'package:dona/common/widgets/text/product_title_text.dart';
import 'package:dona/utils/constants/colors.dart';
import 'package:dona/utils/constants/enums.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/icons/circular_icon.dart';

class AppProductMetaData extends StatelessWidget {
  const AppProductMetaData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Price and Promotion
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: AppSizes.spaceBetweenItems / 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AppProductPriceText(
                  price: 150,
                  isLarge: true,
                  priceWas: 200,
                ),
                Row(
                  children: [
                    // Share button
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(CupertinoIcons.heart,
                          size: AppSizes.iconMd),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(CupertinoIcons.share,
                          size: AppSizes.iconMd),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: AppSizes.spaceBetweenItems / 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    AppRoundedContainer(
                      radius: AppSizes.sm,
                      backgroundColor: AppColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.sm, vertical: AppSizes.xs),
                      child: Text(
                        'Poupe 25%',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: AppColors.black),
                      ),
                    ),
                    const SizedBox(
                      width: AppSizes.spaceBetweenItems,
                    ),
                    AppRoundedContainer(
                      radius: AppSizes.sm,
                      backgroundColor: AppColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.sm, vertical: AppSizes.xs),
                      child: Text(
                        'Disponivel',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: AppColors.black),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    AppCircularIcon(
                      onPressed: () {},
                      icon: CupertinoIcons.minus,
                      height: 32,
                      width: 32,
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
                      height: 32,
                      width: 32,
                      size: AppSizes.iconSm,
                      color: AppColors.white,
                      backgroundColor: AppColors.primary,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: AppSizes.spaceBetweenItems / 1.5,
        ),
        //Title
        const AppProductTitleText(title: "Nike Air Max 270 Red Sneaker"),
        const SizedBox(
          height: AppSizes.spaceBetweenItems / 4,
        ),
        //Supplier
        const AppBrandTextTitleWithVerticalIcon(
          title: 'Ojiaenda',
          brandTextSize: TextSizes.medium,
        ),
      ],
    );
  }
}

import 'package:dona/common/widgets/chips/choice_chip.dart';
import 'package:dona/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:dona/common/widgets/product/product_card/product_price_text.dart';
import 'package:dona/common/widgets/text/product_title_text.dart';
import 'package:dona/common/widgets/text/section_heading.dart';
import 'package:dona/utils/constants/colors.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:dona/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class AppProductAttribute extends StatelessWidget {
  const AppProductAttribute({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = AppHelperFuncions.isDarkMode(context);
    return Column(
      children: [
        AppRoundedContainer(
          padding: const EdgeInsets.all(AppSizes.md),
          backgroundColor: isDark ? AppColors.darkGrey : AppColors.grey,
          child: Column(
            children: [
              // Title, Price and Stock status
              Row(
                children: [
                  const AppSectionHeading(
                    title: "Variation",
                    showActionButton: false,
                  ),
                  const SizedBox(
                    width: AppSizes.spaceBetweenItems,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Price
                      const Row(
                        children: [
                          AppProductTitleText(
                            title: 'Price : ',
                            isSmallSize: true,
                          ),
                          AppProductPriceText(
                            price: '250',
                            priceWas: '300',
                          ),
                        ],
                      ),
                      // Stock
                      Row(
                        children: [
                          const AppProductTitleText(
                            title: 'Stock : ',
                            isSmallSize: true,
                          ),
                          Text(
                            "in stock",
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      ),
                      // variation description
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: AppSizes.spaceBetweenItems,
        ),

        // attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppSectionHeading(title: 'Colors'),
            const SizedBox(
              height: AppSizes.spaceBetweenItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                AppChoiceChip(
                  text: 'Green',
                  onSelected: (value) {},
                  selected: true,
                ),
                AppChoiceChip(
                  text: 'Red',
                  onSelected: (value) {},
                  selected: false,
                ),
                AppChoiceChip(
                  text: 'Black',
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppSectionHeading(title: 'Sizes'),
            const SizedBox(
              height: AppSizes.spaceBetweenItems / 2,
            ),
            Wrap(spacing: 8, children: [
              AppChoiceChip(
                text: 'EU 30',
                selected: true,
                onSelected: (value) {},
              ),
              AppChoiceChip(
                text: 'EU 32',
                selected: false,
                onSelected: (value) {},
              ),
              AppChoiceChip(
                text: 'EU 34',
                selected: false,
                onSelected: (value) {},
              ),
            ]),
          ],
        )
      ],
    );
  }
}

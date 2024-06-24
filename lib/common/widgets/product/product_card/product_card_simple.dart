import 'package:dona/common/widgets/images/rounded_image.dart';
import 'package:dona/common/widgets/product/product_card/product_price_text.dart';
import 'package:dona/common/widgets/text/product_title_text.dart';
import 'package:dona/utils/constants/colors.dart';
import 'package:dona/utils/constants/image_strings.dart';
import 'package:dona/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';


class AppProductSimpleCard extends StatelessWidget {
  const AppProductSimpleCard(
      {Key? key,
      required this.price,
      required this.unit,
      required this.totalPrice})
      : super(key: key);

  final double price, totalPrice;
  final String unit;

  @override
  Widget build(BuildContext context) {
    final isDark = AppHelperFuncions.isDarkMode(context);
    const double size = 70;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: size,
          child: Row(
            children: [
              // Thumbnail
              const AppRoundedImage(
                width: size,
                height: size,
                imageUrl: AppImages.productImage3,
                backgroundColor: AppColors.secondary,
                applyImageRadius: false,
              ),
              const SizedBox(width: 12),
              // Details
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const AppProductTitleText(
                    title: "Pepsi can set",
                  ),
                  // const SizedBox(
                  //   height: AppSizes.spaceBetweenItems / 8,
                  // ),
                  // const AppBrandTextTitleWithVerticalIcon(
                  //   title: 'Golf 2',
                  // ),
                  AppProductPriceText(
                    price: price,
                    unit: unit,
                  )
                ],
              ),
            ],
          ),
        ),
        Column(
          children: [
            Text(
              'Total',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            AppProductPriceText(
              price: totalPrice,
              unit: 'kg',
            ),
          ],
        ),
      ],
    );
  }
}

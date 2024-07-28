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
      required this.totalPrice,
      required this.imageUrl,
      required this.name})
      : super(key: key);

  final double price, totalPrice;
  final String unit, imageUrl, name;

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
              imageUrl != ""
                  ? AppRoundedImage(
                      width: size,
                      height: size,
                      isNetworkImage: true,
                      imageUrl: imageUrl,
                      backgroundColor: AppColors.softGrey,
                      applyImageRadius: false,
                    )
                  : const AppRoundedImage(
                      width: size,
                      height: size,
                      // isNetworkImage: false,
                      imageUrl: AppImages.lightAppLogo,
                      backgroundColor: AppColors.softGrey,
                      applyImageRadius: false,
                    ),

              const SizedBox(width: 12),
              // Details
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppProductTitleText(
                    title: name,
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
              unit: unit,
            ),
          ],
        ),
      ],
    );
  }
}

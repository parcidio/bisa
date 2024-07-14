import 'package:dona/common/widgets/brand/brand_card_horizontal.dart';
import 'package:dona/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:dona/utils/constants/colors.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:dona/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class AppBrandShowcase extends StatelessWidget {
  const AppBrandShowcase({
    super.key,
    required this.images,
    required this.brandIcon,
    required this.brandName,
    required this.brandDetail,
  });

  final List<String> images;
  final String brandIcon, brandName, brandDetail;

  @override
  Widget build(BuildContext context) {
    return AppRoundedContainer(
      showBorder: true,
      padding: const EdgeInsets.all(AppSizes.md),
      borderColor: AppColors.darkGrey,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: AppSizes.spaceBetweenItems),
      child: Column(children: [
        // Brand with product count
        AppBrandCardHorizontal(
          brandIcon: brandIcon,
          brandName: brandName,
          product: brandDetail,
          demand: '',
          showBorder: false,
        ),
        // Brand top 3 products
        Row(
            children: images
                .map((image) => brandTopProductImageWidget(image, context))
                .toList()),
        const SizedBox(
          height: AppSizes.spaceBetweenItems,
        )
      ]),
    );
  }
}

Widget brandTopProductImageWidget(String image, context) {
  return Expanded(
      child: AppRoundedContainer(
    height: 100,
    backgroundColor: AppHelperFuncions.isDarkMode(context)
        ? AppColors.accent
        : AppColors.light,
    margin: const EdgeInsets.only(right: AppSizes.sm),
    padding: const EdgeInsets.all(AppSizes.md),
    child: Image(fit: BoxFit.contain, image: AssetImage(image)),
  ));
}

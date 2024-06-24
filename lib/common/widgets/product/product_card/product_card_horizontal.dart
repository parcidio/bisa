import 'package:dona/common/styles/shadows_styles.dart';
import 'package:dona/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:dona/common/widgets/images/rounded_image.dart';
import 'package:dona/common/widgets/product/product_card/product_price_text.dart';
import 'package:dona/presentation/shop/product_details/product_details.dart';
import 'package:dona/presentation/shop/product_details/widgets/product_description.dart';
import 'package:dona/utils/constants/colors.dart';
import 'package:dona/utils/constants/enums.dart';
import 'package:dona/utils/constants/image_strings.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:dona/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../icons/circular_icon.dart';
import '../../text/brand_text_tile.dart';
import '../../text/brand_title_text_with_vertical_icon.dart';
import '../../text/product_title_text.dart';

class AppProductCardHorizontal extends StatelessWidget {
  const AppProductCardHorizontal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = AppHelperFuncions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => const AppProductDetails()),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.spaceBetweenSections),
        child: Container(
          height: 85,
          padding: const EdgeInsets.symmetric(vertical: AppSizes.xs),
          margin: const EdgeInsets.symmetric(vertical: AppSizes.xs),
          decoration: BoxDecoration(
            boxShadow: [AppShadowstyle.verticalProductShadow],
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Thumbnail
                  Container(
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: AppSizes.sm),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween, // Ensures space between item details and item counter
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const AppRoundedImage(
                            backgroundColor: AppColors.softGrey,
                            width: 60,
                            height: 60,
                            imageUrl: AppImages.productImage3,
                            applyImageRadius: true,
                          ),
                          // Item details
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSizes.sm),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                AppProductTitleText(
                                  title: "Pepsi can set",
                                  isSmallSize: true,
                                ),
                                AppBrandTextTile(
                                  title: "Grade de 24 itens",
                                  maxLines: 1,
                                  brandTextSize: TextSizes.small,
                                ),
                                AppProductPriceText(
                                  price: 500,
                                  isLarge: false,
                                ),
                              ],
                            ),
                          ),
                          // Item count
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        AppCircularIcon(
                          onPressed: () {},
                          icon: CupertinoIcons.minus,
                          size: AppSizes.iconXs,
                          height: 32,
                          width: 32,
                          color: AppColors.white,
                          backgroundColor: AppColors.primary,
                        ),
                        const SizedBox(
                          width: AppSizes.sm,
                        ),
                        Text('2',
                            style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(
                          width: AppSizes.sm,
                        ),
                        AppCircularIcon(
                          onPressed: () {},
                          size: AppSizes.iconXs,
                          icon: CupertinoIcons.add,
                          height: 32,
                          width: 32,
                          color: AppColors.white,
                          backgroundColor: AppColors.primary,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}

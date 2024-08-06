import 'package:dona/common/styles/shadows_styles.dart';
import 'package:dona/common/widgets/images/rounded_image.dart';
import 'package:dona/common/widgets/product/product_card/product_price_text.dart';
import 'package:dona/presentation/shop/product_details/product_details.dart';
import 'package:dona/utils/constants/colors.dart';
import 'package:dona/utils/constants/enums.dart';
import 'package:dona/utils/constants/image_strings.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:dona/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../icons/circular_icon.dart';
import '../../text/brand_text_tile.dart';
import '../../text/product_title_text.dart';

class AppProductCardHorizontal extends StatelessWidget {
  const AppProductCardHorizontal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = AppHelperFuncions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => const AppProductDetails(
            productId: "",
            product: {},
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
        child: Container(
          height: 75,
          padding: const EdgeInsets.symmetric(vertical: AppSizes.xs),
          margin: const EdgeInsets.symmetric(vertical: AppSizes.xs),
          decoration: BoxDecoration(
            boxShadow: [AppShadowstyle.verticalProductShadow],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Thumbnail
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceBetween, // Ensures space between item details and item counter
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppRoundedImage(
                          backgroundColor: AppColors.accent,
                          width: 60,
                          height: 40,
                          imageUrl: AppImages.productImage3,
                          applyImageRadius: true,
                        ),
                        // Item details
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: AppSizes.sm),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
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
                                isSmall: true,
                              ),
                            ],
                          ),
                        ),
                        // Item count
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
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
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
import 'package:logger/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppProductCardVertical extends StatelessWidget {
  const AppProductCardVertical(
      {super.key,
      required this.name,
      required this.productId,
      required this.price,
      required this.rate,
      this.priceWas = 0,
      this.description = "",
      this.currencySign = "",
      this.unit = "",
      this.place = "",
      required this.product,
      this.imageUrl = ""});

  final String name, imageUrl, productId;
  final double price, priceWas, rate;
  final String description, currencySign, unit, place;
  final Map<String, dynamic> product;

  @override
  Widget build(BuildContext context) {
    final isDark = AppHelperFuncions.isDarkMode(context);
    final supabase = Supabase.instance.client;
    final asset = supabase.storage
        .from('products')
        .getPublicUrl('detergent-removebg-preview.png');

    Logger logger = Logger();
    logger.i(product);

    return GestureDetector(
      onTap: () => Get.to(() => AppProductDetails(
            productId: productId,
            product: product,
          )),
      child: SizedBox(
        width: 240,
        height: 200,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // Thumbnail
          AppRoundedContainer(
            height: 130,
            // padding: const EdgeInsets.all(AppSizes.xs),
            backgroundColor: isDark ? AppColors.dark : AppColors.white,
            child: Stack(
              children: [
                // product image
                imageUrl != ""
                    ? AppRoundedImage(
                        width: 180,
                        height: 100,
                        isNetworkImage: true,
                        imageUrl: imageUrl,
                        applyImageRadius: true,
                      )
                    : const AppRoundedImage(
                        width: 180,
                        height: 100,
                        isNetworkImage: false,
                        imageUrl: AppImages.greenAppLogo,
                        applyImageRadius: true,
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppProductTitleText(
                    title: name,
                    isSmallSize: true,
                  ),
                  // const SizedBox(
                  //   height: AppSizes.spaceBetweenItems / 8,
                  // ),
                  // AppBrandTextTitleWithVerticalIcon(
                  //   title: description,
                  // ),
                ],
              ),
            ]),
          ),
          // const Spacer(),
          // const SizedBox(
          //   height: AppSizes.spaceBetweenItems / 2,
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.xs),
            child: AppProductPriceText(
              price: price,
              unit: unit,
              currencySign: currencySign,
              isSmall: true,
              priceWas: priceWas,
            ),
          )
        ]),
      ),
    );
  }
}

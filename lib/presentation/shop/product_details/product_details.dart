import 'package:dona/common/widgets/appbar/appbar.dart';
import 'package:dona/common/widgets/text/section_heading.dart';
import 'package:dona/presentation/shop/product_details/widgets/bottom_add_to_cart.dart';
import 'package:dona/presentation/shop/product_details/widgets/product_attributes.dart';
import 'package:dona/presentation/shop/product_details/widgets/product_image_slider.dart';
import 'package:dona/presentation/shop/product_details/widgets/product_meta_data.dart';
import 'package:dona/presentation/shop/product_details/widgets/product_rating_share.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '../../../common/widgets/product/cart/cart_menu_icon.dart';
import '../../../utils/constants/colors.dart';

class AppProductDetails extends StatelessWidget {
  const AppProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(showSearchBar: false, showBackArrow: true,  actions: [
          AppCartMenuIcon(
            onPressed: () {},
            iconColor: AppColors.black,
          )]),
      bottomNavigationBar: AppBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [               
      const AppProductImageSlider(),
            // product details
            Padding(
              padding: const EdgeInsets.only(
                  right: AppSizes.defaultSpace,
                  left: AppSizes.defaultSpace,
                  bottom: AppSizes.defaultSpace),
              child: Column(
                children: [
                  // Price, Title, Stock and Brand
                  const AppProductMetaData(),
                  // Rating and Share button
                  const AppRatingShare(),
                  // Attributes
                  const AppProductAttribute(),
                  const SizedBox(
                    height: AppSizes.spaceBetweenItems,
                  ),
                  // Checkout Button
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text("Comprar agora"))),
                  const SizedBox(
                    height: AppSizes.spaceBetweenItems,
                  ),
                  // Description
                  const AppSectionHeading(
                    title: 'Description',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBetweenItems,
                  ),
                  const ReadMoreText(
                    'This method will save memory by building items once it becomes necessary. This way they won\'t be built if they\'re not currently meant to be visible on screen. It can be used to build different child item widgets related to content or by item index.',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Show Less',
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                  // Reviews
                  const Divider(),
                  const SizedBox(
                    height: AppSizes.spaceBetweenItems,
                  ),
                  Row(
                    children: [
                      const AppSectionHeading(
                        title: "Reviews (200)",
                        showActionButton: false,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Iconsax.arrow_right3,
                              size: AppSizes.iconMd))
                    ],
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBetweenSections,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

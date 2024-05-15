import 'package:dona/common/widgets/appbar/appbar.dart';
import 'package:dona/common/widgets/text/section_heading.dart';
import 'package:dona/presentation/shop/product_details/widgets/bottom_add_to_cart.dart';
import 'package:dona/presentation/shop/product_details/widgets/product_attributes.dart';
import 'package:dona/presentation/shop/product_details/widgets/product_image_slider.dart';
import 'package:dona/presentation/shop/product_details/widgets/product_meta_data.dart';
import 'package:dona/presentation/shop/product_details/widgets/product_rating_share.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '../../../common/widgets/flat_cards/leadtime_flat_card.dart';
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
                  const Divider(),

                  // Description
                  const AppSectionHeading(
                    title: 'Description',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBetweenItems/2,
                  ),
                  const ReadMoreText(
                    'This method will save memory by building items once it becomes necessary. This way they won\'t be built if they\'re not currently meant to be visible on screen. It can be used to build different child item widgets related to content or by item index.',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Mais',
                    trimExpandedText: 'Menos',
                    lessStyle:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                    moreStyle:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                  ),
                   const Divider(),
                  
                  const SizedBox(
                    height: AppSizes.spaceBetweenItems,
                  ),
                  Container(
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(.2),        
        border: Border(
          top: BorderSide(color: AppColors.primary.withOpacity(.5), width: 2.0),
          bottom: BorderSide(color: AppColors.primary.withOpacity(.5), width: 2.0),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                CupertinoIcons.cube_box,
                color: Colors.black,
              ),
              SizedBox(width: 8.0),
                       Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text.rich(TextSpan(children: [               
                                         
                                         TextSpan(
                                             text: ' Frete para ',
                                             style: Theme.of(context).textTheme.bodyMedium!.apply(
                                                 color:  AppColors.primary,
                                                 )),
                                         TextSpan(
                                             text: ' Benguela ',
                                             style: Theme.of(context).textTheme.bodyMedium!.apply(
                                                 color: AppColors.primary,
                                                 decoration: TextDecoration.underline,
                                                 decorationColor:
                             AppColors.primary)),
                                         
                                                 ])),
                                                 Text(
                       ' 5046.65 KZ ',
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                          color: AppColors.primary,
                          ))
                         ],
                       ),
            ],
          ),
        Icon(
            CupertinoIcons.right_chevron,
            color: Colors.black,
          ),
        ],
      ),
    ),

     const SizedBox(
                    height: AppSizes.spaceBetweenItems,
                  ),
                  LeadTimeCard(deliveryDays: 4,dispatchDays: 2, minQuantity: 1, maxQuantity: 20, ),
                  // Reviews
                 


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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dona/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:dona/common/widgets/product/product_card/product_price_text.dart';
import 'package:dona/utils/constants/colors.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:dona/common/widgets/icons/circular_icon.dart';
// import 'package:dona/common/widgets/product/product_rating_share.dart';
import 'item_count_controller.dart'; // Import your ItemController

class AppProductMetaData extends StatelessWidget {
  const AppProductMetaData({
    super.key,
    this.name = "",
    this.place = "",
    this.price = 0,
    this.priceWas = 0,
    this.stock = 0,
  });

  final int stock;
  final String name, place;
  final double price, priceWas;

  @override
  Widget build(BuildContext context) {
    final ItemCountController itemController = Get.find<ItemCountController>();

    var discount = price / priceWas * 100;

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
                AppProductPriceText(
                  price: price,
                  isSmall: false,
                  priceWas: priceWas,
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
                    price < priceWas && discount >= 1
                        ? Row(
                            children: [
                              AppRoundedContainer(
                                radius: AppSizes.sm,
                                backgroundColor:
                                    AppColors.secondary.withOpacity(0.8),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: AppSizes.sm,
                                    vertical: AppSizes.xs),
                                child: Text(
                                  'Poupe ${discount.toStringAsFixed(0)}%',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .apply(color: AppColors.black),
                                ),
                              ),
                              SizedBox(
                                width: AppSizes.spaceBetweenItems,
                              ),
                            ],
                          )
                        : SizedBox(),
                    AppRoundedContainer(
                      radius: AppSizes.sm,
                      backgroundColor: AppColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.sm, vertical: AppSizes.xs),
                      child: Text(
                        stock != 0 ? 'Disponivel' : "Indisponivel",
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: AppColors.black),
                      ),
                    ),
                    SizedBox(
                      width: AppSizes.spaceBetweenItems * .2,
                    ),
                    AppRoundedContainer(
                      radius: AppSizes.sm,
                      backgroundColor: AppColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.sm, vertical: AppSizes.xs),
                      child: Text(
                        stock != 0 ? 'Entrega' : "Indisponivel",
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
                      onPressed: itemController.decreaseCount,
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
                    Obx(() => Text(
                          '${itemController.itemCount}',
                          style: Theme.of(context).textTheme.titleMedium,
                        )),
                    const SizedBox(
                      width: AppSizes.spaceBetweenItems,
                    ),
                    AppCircularIcon(
                      onPressed: itemController.increaseCount,
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
        // Rating
        // const AppRatingShare(),
        // Title
        Text(name,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(
          height: AppSizes.spaceBetweenItems / 4,
        ),
        // Supplier
        // AppBrandTextTitleWithVerticalIcon(
        //   title: place,
        //   brandTextSize: TextSizes.medium,
        // ),
      ],
    );
  }
}

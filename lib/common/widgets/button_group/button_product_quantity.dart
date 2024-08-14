import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/product_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../icons/circular_icon.dart';

class ButtonProductQuantity extends StatelessWidget {
  ButtonProductQuantity({super.key});

  // final ProductController _productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    RxInt count = 0.obs;
    void incrementQuantity() {
      count++;
    }

    void decrementQuantity() {
      if (count > 0) {
        count--;
      }
    }

    return Row(
      children: [
        AppCircularIcon(
          onPressed: decrementQuantity,
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
        Obx(() =>
            Text('${count}', style: Theme.of(context).textTheme.titleMedium)),
        const SizedBox(
          width: AppSizes.spaceBetweenItems,
        ),
        AppCircularIcon(
          onPressed: incrementQuantity,
          icon: CupertinoIcons.add,
          height: 32,
          width: 32,
          size: AppSizes.iconSm,
          color: AppColors.white,
          backgroundColor: AppColors.primary,
        ),
      ],
    );
  }
}

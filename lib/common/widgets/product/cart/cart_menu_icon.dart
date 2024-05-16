import 'package:dona/utils/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../presentation/shop/cart/cart.dart';

class AppCartMenuIcon extends StatelessWidget {
  const AppCartMenuIcon({
    super.key,
    this.iconColor = AppColors.white,
  
  });

  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: () => Get.to(() => const AppCartScreen()),
          icon: const Icon(CupertinoIcons.bag),
          color: iconColor,
        ),
        Positioned(
            right: 0,
            child: Container(
              height: 18,
              width: 18,              
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(100)),
              child: Center(
                child: Text('2',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .apply(color: AppColors.white, fontSizeFactor: 0.8)),
              ),
            ))
      ],
    );
  }
}

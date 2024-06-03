import 'package:dona/utils/constants/colors.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../presentation/shop/cart/cart.dart';

class AppMenuIcon extends StatelessWidget {
  const AppMenuIcon({
    super.key,
    this.iconColor = AppColors.black,
    required this.icon,
    this.numberOfNotification = 0,
  });

  final Color? iconColor;
  final Icon icon;
  final int? numberOfNotification;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: () => Get.to(() => const AppCartScreen()),
          icon: icon,
          color: iconColor,
        ),
        numberOfNotification != 0
            ? Positioned(
                right: 8,
                top: 8,
                child: Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(100)),
                  child: Center(
                    child: Text(numberOfNotification.toString(),
                        style: Theme.of(context).textTheme.labelLarge!.apply(
                            color: AppColors.white, fontSizeFactor: 0.8)),
                  ),
                ))
            : const SizedBox(
                width: 0,
              )
      ],
    );
  }
}

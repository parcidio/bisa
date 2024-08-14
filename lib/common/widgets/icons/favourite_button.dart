import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class FavouriteButton extends StatelessWidget {
  const FavouriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isFavourite = true.obs;

    void setToFavourite() {
      isFavourite.value = !isFavourite.value;
    }

    return Obx(() => IconButton(
          onPressed: setToFavourite,
          icon: isFavourite == true
              ? Icon(CupertinoIcons.heart, size: AppSizes.iconMd)
              : Icon(
                  CupertinoIcons.heart_fill,
                  size: AppSizes.iconMd,
                  color: AppColors.error,
                ),
        ));
  }
}

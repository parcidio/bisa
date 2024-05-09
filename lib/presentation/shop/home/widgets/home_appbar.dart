import 'package:dona/common/widgets/appbar/appbar.dart';
import 'package:dona/common/widgets/product/cart/cart_menu_icon.dart';
import 'package:dona/utils/constants/colors.dart';
import 'package:dona/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class AppHomeAppbar extends StatelessWidget {
  const AppHomeAppbar({
    super.key,
    this.onTap,
  });

  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return AppAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppTexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: AppColors.grey),
          ),
          Text(
            AppTexts.homeAppbarSubTitle,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: AppColors.white),
          )
        ],
      ),
      actions: [
        AppCartMenuIcon(
          onPressed: () {},
          iconColor: AppColors.white,
        )
      ],
    );
  }
}

import 'package:dona/utils/constants/colors.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:dona/utils/device/device._utility.dart';
import 'package:dona/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppSearchContainer extends StatelessWidget {
  const AppSearchContainer({
    super.key,
    this.showIconPrefix = true,
    this.showIconSuffix = true,
    this.showBackground = true,
    this.showBorder = true,
    this.iconPrefix,
    this.iconSuffix,
    this.text = "Search...",
    this.secondText = "",
    this.padding =
        const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
  });

  final IconData? iconPrefix, iconSuffix;
  final String text;
  final String secondText;
  final bool showIconPrefix, showIconSuffix, showBackground, showBorder;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = AppHelperFuncions.isDarkMode(context);
    return PreferredSize(
          preferredSize: Size.fromHeight(100.0),
      child: Padding(
          padding: padding,
          child: Container(
            width: AppDeviceUtils.getScreenWidth(context),
            padding: const EdgeInsets.all(AppSizes.sm),
            decoration: BoxDecoration(
                color: showBackground
                    ? isDarkMode
                        ? AppColors.dark
                        : AppColors.light
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(AppSizes.cardRadiusXs),
                ),
            child: Row(
              children: [
                Expanded(
                    child: Row(children: [
                  const Icon(CupertinoIcons.search, color: AppColors.darkGrey),
                  const SizedBox(width: AppSizes.spaceBetweenItems),
                  Text("$text ", style: Theme.of(context).textTheme.bodySmall),                
                  Text(secondText, style: Theme.of(context).textTheme.labelLarge)
                ])),
                showIconSuffix
                    ? Icon(iconSuffix, color: AppColors.darkerGrey)
                    : const SizedBox(),
              ],
            ),
          )),
    );
  }
}

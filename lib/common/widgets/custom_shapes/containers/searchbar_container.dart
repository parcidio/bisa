import 'package:dona/utils/constants/colors.dart';
import 'package:dona/utils/constants/sizes.dart';
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
    this.text = "Pesquisa...",
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
      preferredSize: const Size.fromHeight(100.0),
      child: Container(
        height: 40,
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextField(
          cursorColor: AppColors.black,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 10),
            prefixIcon: const Icon(CupertinoIcons.search, color: AppColors.darkGrey),
            hintText: '$text $secondText',
            hintStyle: const TextStyle(color: Colors.grey),
            filled: true,
            fillColor: showBackground
                ? isDarkMode
                    ? AppColors.dark
                    : AppColors.light
                : Colors.transparent,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.cardRadiusXs),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}

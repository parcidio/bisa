import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(
      {super.key, required this.hintText, this.icon, this.iconSuffix});
  final String hintText;
  final IconData? icon, iconSuffix;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(bottom: 10),
      child: TextField(
        cursorColor: AppColors.black,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
          hintText: hintText,
          prefixIcon: Icon(
            icon,
            color: AppColors.darkGrey,
            size: AppSizes.iconSm,
          ),
          suffixIcon: Icon(
            iconSuffix,
            color: AppColors.darkGrey,
            size: AppSizes.md,
          ),
          hintStyle: const TextStyle(color: Colors.grey),
          filled: true,
          fillColor: AppColors.light,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizes.cardRadiusXs),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

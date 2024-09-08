import 'dart:ffi';

import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class AppTextField extends StatelessWidget {
  AppTextField(
      {super.key,
      required this.hintText,
      this.icon,
      this.iconSuffix,
      this.onChanged,
      this.isObscure = false});
  final String hintText;
  final IconData? icon, iconSuffix;
  final void Function(String)? onChanged;
  bool isObscure = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(bottom: 10),
      child: TextField(
        obscureText: isObscure,
        onChanged: onChanged,
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

import 'package:dona/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class AppElevatedButtonTheme {
  AppElevatedButtonTheme._();

  static ElevatedButtonThemeData lightElevatedButtonTheme =
      ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              elevation: 0,
              foregroundColor: AppColors.white,
              backgroundColor: AppColors.primary,
              disabledForegroundColor: AppColors.grey,
              disabledBackgroundColor: AppColors.grey,
              side: const BorderSide(color: AppColors.primary),
              // padding: const EdgeInsets.symmetric(vertical: AppSizes.defaultSpace),
              textStyle:
                  const TextStyle(
                      fontSize: 16,
                      color: AppColors.white,
                      fontWeight: FontWeight.w300),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizes.cardRadiusSm))));
  static ElevatedButtonThemeData darkElevatedButtonTheme =
      ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              elevation: 0,
              foregroundColor: AppColors.white,
              backgroundColor: AppColors.primary,
              disabledForegroundColor: AppColors.grey,
              disabledBackgroundColor: AppColors.grey,
              side: const BorderSide(color: AppColors.primary),
              // padding: const EdgeInsets.symmetric(vertical: AppSizes.defaultSpace),
              textStyle: const TextStyle(
                  fontSize: 16,
                  color: AppColors.white,
                  fontWeight: FontWeight.w300),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizes.cardRadiusSm))));
}

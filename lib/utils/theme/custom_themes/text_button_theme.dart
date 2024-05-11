import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class AppTextButtonTheme {
  AppTextButtonTheme._();

  static TextButtonThemeData lightTextTheme = TextButtonThemeData(
      style: TextButton.styleFrom(
          textStyle: const TextStyle(
    color: AppColors.primary,
  )));

  static TextButtonThemeData darkTextTheme = TextButtonThemeData(
      style: TextButton.styleFrom(
          textStyle: const TextStyle(
    color: AppColors.primary,
  )));
}

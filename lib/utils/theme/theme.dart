import "package:dona/utils/theme/custom_themes/appbar_theme.dart";
import "package:dona/utils/theme/custom_themes/bottom_sheet_theme.dart";
import "package:dona/utils/theme/custom_themes/checkbox_theme.dart";
import "package:dona/utils/theme/custom_themes/chip_theme.dart";
import "package:dona/utils/theme/custom_themes/elevated_button_theme.dart";
import "package:dona/utils/theme/custom_themes/inputfield_theme.dart";
import "package:dona/utils/theme/custom_themes/outline_button_theme.dart";
import 'package:dona/utils/theme/custom_themes/text_button_theme.dart';
import "package:dona/utils/theme/custom_themes/text_theme.dart";
import "package:flutter/material.dart";

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      textTheme: AppTextTheme.lightTextTheme,
      elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedButtonTheme,
      checkboxTheme: AppCheckboxTheme.lihgtCheckboxThemeData,
      bottomSheetTheme: AppBottomSheetTheme.lightBottomSheetTheme,
      outlinedButtonTheme: AppOutlineButtonTheme.lightOutlineButtonTheme,
      inputDecorationTheme: AppTextFormFieldTheme.lightInputDecorationTheme,
      chipTheme: AppChipTheme.lightChipTheme,
      appBarTheme: AppAppBarTheme.lightAppBarTheme,
      textButtonTheme: AppTextButtonTheme.lightTextTheme);

  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.black,
      textTheme: AppTextTheme.darkTextTheme,
      elevatedButtonTheme: AppElevatedButtonTheme.darkElevatedButtonTheme,
      checkboxTheme: AppCheckboxTheme.darkCheckboxThemeData,
      bottomSheetTheme: AppBottomSheetTheme.darkBottomSheetTheme,
      outlinedButtonTheme: AppOutlineButtonTheme.darkOutlineButtonTheme,
      inputDecorationTheme: AppTextFormFieldTheme.darkInputDecorationTheme,
      chipTheme: AppChipTheme.darkChipTheme,
      appBarTheme: AppAppBarTheme.darkAppBarTheme,
      textButtonTheme: AppTextButtonTheme.darkTextTheme);
}

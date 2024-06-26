import 'package:flutter/material.dart';

class AppChipTheme {
  AppChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
      disabledColor: const Color.fromRGBO(158, 158, 158, 1).withOpacity(0.4),
      labelStyle: const TextStyle(color: Colors.black),
      selectedColor: Colors.green,
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      checkmarkColor: Colors.white);

  static ChipThemeData darkChipTheme = ChipThemeData(
      disabledColor: Colors.grey.withOpacity(0.4),
      labelStyle: const TextStyle(color: Colors.white),
      selectedColor: Colors.green,
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      checkmarkColor: Colors.white);
}

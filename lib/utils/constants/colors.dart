import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  //App basic colors
  static const Color primary = Color(0xFF135C3A);
  static const Color secondary = Color(0xFFFFC93D);
  static const Color accent = Color(0xFFFFFFF6);

  Gradient linearGradient = const LinearGradient(
      begin: Alignment(0.0, 0.0),
      end: Alignment(0.700, -0.707),
      colors: [
        Color(0xFF388E3C),
        Color.fromARGB(255, 92, 198, 97),
        Color.fromARGB(255, 118, 139, 119),
      ]);

  // Text colors
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6C7570);
  static const Color textWhite = Colors.white;

  // Background colors
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF272727);
  static const Color primaryBackground = Color(0XFFF3F3F3);

  // Button colors
  static const Color buttonPrimary = Color(0xFF388E3C);
  static const Color buttonSecondary = Color(0xFF6C7570);
  static const Color buttonDisabled = Color(0xFFC4C4C4);

  // Background Container colors
  static const Color lightContainer = Color(0xFFF6F6F6);
  static Color darkContainer = Colors.white.withOpacity(0.1);

  // Border colors
  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFF6C7570);

  // ERROR and validation colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF4b68ff);

  // Neutral Shades
  static const Color black = Color(0xFF232323);
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color softGrey = Color(0xFFF4F4F4);
  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color white = Color(0xFFFFFFFF);
}

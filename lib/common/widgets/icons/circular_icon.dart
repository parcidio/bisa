import 'package:dona/utils/constants/colors.dart';
import 'package:dona/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class AppCircularIcon extends StatelessWidget {
  const AppCircularIcon({
    super.key,
    this.width,
    this.height,
    this.size,
    required this.onPressed,
    this.icon,
    this.backgroundColor,
    this.color,
  });

  final double? width, height, size;
  final VoidCallback onPressed;
  final IconData? icon;
  final Color? backgroundColor, color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          boxShadow: List.filled(
              10,
              BoxShadow(
                  color: AppColors.secondary.withOpacity(0.4),
                  offset: Offset.fromDirection(10, 3))),
          borderRadius: BorderRadius.circular(10),
          color: backgroundColor ??
              (AppHelperFuncions.isDarkMode(context)
                  ? AppColors.black.withOpacity(0.9)
                  : AppColors.white.withOpacity(0.9))),
      child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: size,
            color: color,
          )),
    );
  }
}

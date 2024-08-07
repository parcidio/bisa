import 'package:dona/utils/constants/colors.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:dona/utils/device/device._utility.dart';
import 'package:dona/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class AppTabBar extends StatelessWidget implements PreferredSizeWidget {
  const AppTabBar({
    super.key,
    required this.tabs,
    this.isScrollable = true,
  });

  final List tabs;
  final bool isScrollable;

  @override
  Widget build(BuildContext context) {
    final isDark = AppHelperFuncions.isDarkMode(context);
    return Material(
      color: isDark ? AppColors.black : AppColors.white,
      child: TabBar(
          overlayColor: WidgetStateProperty.all(AppColors.softGrey),
          splashBorderRadius: BorderRadius.circular(AppSizes.cardRadiusXs),
          tabAlignment: TabAlignment.start,
          labelPadding: const EdgeInsetsDirectional.symmetric(horizontal: 15),
          indicatorColor: AppColors.primary,
          isScrollable: isScrollable,
          unselectedLabelColor: AppColors.darkGrey,
          labelColor: isDark ? AppColors.white : AppColors.primary,
          tabs: tabs
              .map((category) => Tab(
                    child: Text(category['title'] + "  " + category['icon']),
                  ))
              .toList()),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppDeviceUtils.getAppBarHeight());
}

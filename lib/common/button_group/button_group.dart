import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_functions.dart';

class AppButtonGroup extends StatelessWidget {
  const AppButtonGroup({super.key, required this.itemList});

final List itemList;
  @override
  Widget build(BuildContext context) {
    final isDark = AppHelperFuncions.isDarkMode(context);
    final controller = GroupButtonController();
    return  Wrap(
              spacing: 8,
              children: [
                GroupButton(
                  isRadio: true,
                  controller: controller,
                  // onSelected: (index, isSelected) => print('$index button is selected'),
                  buttons: itemList,
                  options: GroupButtonOptions(
  selectedShadow: const [],
  selectedTextStyle: TextStyle(
    fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
    color: AppColors.white,
  ),
  selectedColor: AppColors.primary,
  unselectedShadow: const [],
  // unselectedColor: AppColors.tra,
  unselectedTextStyle: TextStyle(
    fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
    color: isDark ? AppColors.light: AppColors.dark,
  ),
  selectedBorderColor: AppColors.secondary,
  unselectedBorderColor: AppColors.darkGrey,
  borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
  spacing: 10,
  runSpacing: 10,
  groupingType: GroupingType.wrap,
  direction: Axis.horizontal,
  buttonHeight: 30,
  // buttonWidth: 30,
  mainGroupAlignment: MainGroupAlignment.start,
  crossGroupAlignment: CrossGroupAlignment.start,
  groupRunAlignment: GroupRunAlignment.start,
  textAlign: TextAlign.center,
  textPadding: EdgeInsets.zero,
  alignment: Alignment.center,
  elevation: 0,
),
                  
              )
              ],
            )
          ;
  }
}
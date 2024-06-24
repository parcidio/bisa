import 'package:dona/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:dona/common/widgets/text/brand_title_text_with_vertical_icon.dart';
import 'package:dona/utils/constants/colors.dart';
import 'package:dona/utils/constants/enums.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class AppBrandCardCategory extends StatefulWidget {
  const AppBrandCardCategory({
    super.key,
    required this.brandIcon,
    required this.brandName,
    this.showBorder = true,
    this.selected = false,
  });

  final String brandIcon;
  final String brandName;
  final bool showBorder, selected;

  @override
  _AppBrandCardCategoryState createState() => _AppBrandCardCategoryState();
}

class _AppBrandCardCategoryState extends State<AppBrandCardCategory> {
  late bool isSelected = false;

  @override
  void initState() {
    super.initState();
    isSelected = widget.selected;
  }

  void _toggleSelection() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleSelection,
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
              AppSizes.cardRadiusSm), // Adjust the radius as needed
          child: AppRoundedContainer(
            backgroundColor: isSelected ? AppColors.primary : Colors.white,
            showBorder: widget.showBorder,
            padding: const EdgeInsets.all(AppSizes.sm),
            child: Text(
              "${widget.brandIcon} ${widget.brandName}",
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: isSelected ? AppColors.light : AppColors.dark),
            ),
          ),
        ),
      ),
    );
  }
}

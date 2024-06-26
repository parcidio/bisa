import 'package:dona/common/widgets/layouts/grid_layout.dart';
import 'package:dona/common/widgets/product/product_card/product_card_vertical.dart';
import 'package:dona/common/widgets/text/section_heading.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/infinite_draggable_slider/infinite_dragable_slider.dart';
import '../../../../common/widgets/infinite_draggable_slider/magazine_cover_image.dart';
import '../../../../domain/entities/magazine.dart';
import '../../../../utils/constants/colors.dart';

class AppCategoryTab extends StatelessWidget {
  const AppCategoryTab({
    super.key,
    this.brandIcon,
    required this.brandName,
    required this.brandDetail,
  });

  final String brandName, brandDetail;
  final String? brandIcon;
  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSizes.defaultSpace),
            child: Column(children: [
              const AppSectionHeading(
                  title: 'Os produtos da praça',
                  buttonTitle: 'Mais',
                  isSmall: true,
                  textColor: AppColors.darkGrey),

              // // Builder(builder: (context) {
              //   return AppProductCardVertical();
              // }),
              AppGridLayout(
                  itemCount: 22,
                  itemCountRow: 3,
                  itemBuilder: (_, index) => const AppProductCardVertical()),
              const SizedBox(
                height: AppSizes.spaceBetweenSections,
              ),
            ]),
          ),
        ]);
  }
}

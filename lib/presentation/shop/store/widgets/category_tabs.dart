import 'package:dona/common/widgets/brand/brand_show_case.dart';
import 'package:dona/common/widgets/layouts/grid_layout.dart';
import 'package:dona/common/widgets/product/product_card/product_card_vertical.dart';
import 'package:dona/common/widgets/text/section_heading.dart';
import 'package:dona/utils/constants/image_strings.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class AppCategoryTab extends StatelessWidget {
  const AppCategoryTab({
    super.key,
    required this.brandIcon,
    required this.brandName,
    required this.brandDetail,
  });

  final String brandIcon, brandName, brandDetail;
  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSizes.defaultSpace),
            child: Column(children: [
              
              // products
              const SizedBox(
                height: AppSizes.spaceBetweenItems,
              ),
              AppSectionHeading(
                title: "You might like",
                onPressed: () {},
              ),
              const SizedBox(
                height: AppSizes.spaceBetweenItems,
              ),
              AppGridLayout(
                  itemCount: 4,
                  itemBuilder: (_, index) => const AppProductCardVertical()),
              const SizedBox(
                height: AppSizes.spaceBetweenSections,
              ),
            ]),
          ),
        ]);
  }
}

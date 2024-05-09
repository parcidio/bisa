import 'package:dona/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:dona/common/widgets/custom_shapes/containers/searchbar_container.dart';
import 'package:dona/common/widgets/layouts/grid_layout.dart';
import 'package:dona/common/widgets/product/product_card/product_card_vertical.dart';
import 'package:dona/common/widgets/text/section_heading.dart';
import 'package:dona/presentation/shop/home/widgets/home_categories.dart';
import 'package:dona/presentation/shop/home/widgets/home_appbar.dart';
import 'package:dona/presentation/shop/home/widgets/promo_slider.dart';
import 'package:dona/utils/constants/image_strings.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(children: [
        const AppPrimaryHeaderContainer(
          child: Column(
            children: [
              // appbar
              AppHomeAppbar(),
              SizedBox(
                height: AppSizes.spaceBetweenSections,
              ),
              // searchbar
              AppSearchContainer(
                text: "Search in the store",
              ),
              SizedBox(
                height: AppSizes.spaceBetweenSections,
              ),
              // categories
              Padding(
                padding: EdgeInsets.only(left: AppSizes.defaultSpace),
                child: Column(children: [
                  // Heading
                  AppSectionHeading(
                    title: 'Popular Categories',
                    textColor: Colors.white,
                    showActionButton: false,
                  ),
                  SizedBox(
                    height: AppSizes.spaceBetweenItems,
                  ),
                  // categories
                  AppHomeCategories(),
                  SizedBox(height: AppSizes.spaceBetweenSections)
                ]),
              )
            ],
          ),
        ),
        // Body
        Padding(
            padding: const EdgeInsets.all(AppSizes.defaultItems),
            child: Column(
              children: [
                const AppPrompSlider(
                  banners: [
                    AppImages.promoBanner2,
                    AppImages.promoBanner2,
                    AppImages.promoBanner2
                  ],
                ),
                const SizedBox(
                  height: AppSizes.spaceBetweenSections,
                ),
                // Heading
                const AppSectionHeading(
                  title: "Popular products",
                ),
                const SizedBox(
                  height: AppSizes.spaceBetweenItems,
                ),

                // Product vertical list
                AppGridLayout(
                  itemCount: 4,
                  itemBuilder: (_, index) => const AppProductCardVertical(),
                ),
              ],
            ))
      ])),
    );
  }
}

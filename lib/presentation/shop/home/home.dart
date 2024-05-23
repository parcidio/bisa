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

            // Body
            child: Padding(
                padding: const EdgeInsets.all(AppSizes.defaultItems),
                child: Column(
                  children: [
                    // Product vertical list
                    AppGridLayout(
                      itemCount: 4,
                      itemBuilder: (_, index) => const AppProductCardVertical(),
                    ),
                  ],
                ))));
  }
}

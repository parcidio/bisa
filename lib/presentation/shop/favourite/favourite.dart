import 'package:dona/common/widgets/appbar/appbar.dart';
import 'package:dona/common/widgets/icons/circular_icon.dart';
import 'package:dona/common/widgets/layouts/grid_layout.dart';
import 'package:dona/common/widgets/product/product_card/product_card_vertical.dart';
import 'package:dona/presentation/shop/home/home.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: Text(
          'Favourite',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          AppCircularIcon(
              onPressed: () => Get.to(const HomeScreen()), icon: Iconsax.add)
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: Column(children: [
          AppGridLayout(
              itemCount: 4,
              itemBuilder: (_, index) => const AppProductCardVertical())
        ]),
      )),
    );
  }
}

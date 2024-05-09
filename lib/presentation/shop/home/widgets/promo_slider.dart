import 'package:dona/applications/shop/controllers/home_controller.dart';
import 'package:dona/common/widgets/custom_shapes/containers/circular_contianer.dart';
import 'package:dona/common/widgets/images/rounded_image.dart';
import 'package:dona/utils/constants/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppPrompSlider extends StatelessWidget {
  const AppPrompSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, _) =>
                  controller.updatePageIndicator(index),
            ),
            items: banners
                .map(
                  (url) => AppRoundedImage(
                    imageUrl: url,
                  ),
                )
                .toList()),
        const SizedBox(
          height: AppSizes.spaceBetweenItems,
        ),
        Center(
          child: Obx(
            () => Row(mainAxisSize: MainAxisSize.min, children: [
              for (int i = 0; i < banners.length; i++)
                AppCircularContainer(
                    margin: const EdgeInsets.only(right: 10),
                    width: 20,
                    height: 4,
                    backgroundColor: controller.couraselCurrentIndex.value == i
                        ? AppColors.primary
                        : AppColors.grey),
            ]),
          ),
        ),
      ],
    );
  }
}

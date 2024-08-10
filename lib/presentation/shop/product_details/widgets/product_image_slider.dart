import 'package:carousel_slider/carousel_slider.dart';
import 'package:dona/common/widgets/images/rounded_image.dart';
import 'package:dona/utils/constants/colors.dart';
import 'package:dona/utils/constants/image_strings.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:dona/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/images/circular_image.dart';

class AppProductImageSlider extends StatelessWidget {
  const AppProductImageSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = AppHelperFuncions.isDarkMode(context);

    return Container(
      color: isDark ? AppColors.darkGrey : AppColors.lightGrey,
      child: Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 400,

              viewportFraction: .8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: true,
              autoPlay: false,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
              pauseAutoPlayInFiniteScroll: true,
              pauseAutoPlayOnManualNavigate: true,
              pauseAutoPlayOnTouch: true,
              aspectRatio: 16 / 9,
              // onPageChanged: (){},
            ),
            items: [1, 2, 3, 4, 5].map((item) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: AppRoundedImage(
                      fit: BoxFit.cover,
                      isNetworkImage: true,
                      imageUrl:
                          "https://images.rawpixel.com/image_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTExL3JtMzYyLTAxYS1tb2NrdXAuanBn.jpg",
                    ),
                  );
                },
              );
            }).toList(),
          ),
          Positioned(
            left: 10,
            bottom: 10,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(AppSizes.cardRadiusLg),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.defaultSpace / 2,
                  vertical: AppSizes.defaultSpace / 4,
                ),
                child: Text(
                  '1 / 8',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.defaultSpace / 2,
                  vertical: AppSizes.defaultSpace / 4,
                ),
                child: AppCircularImage(
                  image: AppImages.nike,
                  width: 40,
                  height: 40,
                  isSvg: true,
                  overlayColor: isDark ? AppColors.white : AppColors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

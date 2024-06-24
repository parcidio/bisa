import 'package:dona/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:dona/common/widgets/product/ratings/RatingBarIndicator.dart';
import 'package:dona/utils/constants/colors.dart';
import 'package:dona/utils/constants/image_strings.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:dona/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class AppUserReviewCard extends StatelessWidget {
  const AppUserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = AppHelperFuncions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                    backgroundImage: AssetImage(
                  AppImages.profile,
                )),
                const SizedBox(
                  width: AppSizes.spaceBetweenItems,
                ),
                Text(
                  "Ageu Vicente",
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(
          height: AppSizes.spaceBetweenItems,
        ),
        Row(
          children: [
            const AppRatingBarIndicator(rating: 4),
            const SizedBox(
              width: AppSizes.spaceBetweenItems,
            ),
            Text(
              "25 Abril 2024",
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
        const SizedBox(
          width: AppSizes.spaceBetweenItems,
        ),
        const ReadMoreText(
          " is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
          trimMode: TrimMode.Line,
          trimLines: 2,
          trimCollapsedText: "Show more",
          trimExpandedText: "Show less",
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.primary),
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.primary),
        ),
        const SizedBox(
          width: AppSizes.spaceBetweenItems,
        ),
        AppRoundedContainer(
          backgroundColor: isDark ? AppColors.darkerGrey : AppColors.grey,
          padding: const EdgeInsets.all(AppSizes.md),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Dona Store",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  "25 Abril 2024",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            const SizedBox(
              width: AppSizes.spaceBetweenItems,
            ),
            const ReadMoreText(
              " is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              trimMode: TrimMode.Line,
              trimLines: 2,
              trimCollapsedText: "Show more",
              trimExpandedText: "Show less",
              moreStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary),
              lessStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary),
            ),
          ]),
        ),
        const SizedBox(
          width: AppSizes.spaceBetweenSections,
        ),
      ],
    );
  }
}

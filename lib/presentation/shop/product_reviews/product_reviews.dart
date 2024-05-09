import 'package:dona/common/widgets/appbar/appbar.dart';
import 'package:dona/common/widgets/product/ratings/RatingBarIndicator.dart';
import 'package:dona/presentation/shop/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:dona/presentation/shop/product_reviews/widgets/rating_progress_indicator_group.dart';
import 'package:dona/presentation/shop/product_reviews/widgets/user_review_card.dart';
import 'package:dona/utils/constants/colors.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:dona/utils/device/device._utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(
        title: Text("Review"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
              "Bem-vindo(a) a bordo! Comece sua jornada sugerindo seu preço e deixe nossos motoristas levá-lo até lá."),
          const SizedBox(height: AppSizes.spaceBetweenItems),
          // Overall rating
          const AppRatingProgressIndicatorGroup(),
          AppRatingBarIndicator(
            rating: 3.5,
          ),
          Text(
            "2032",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          SizedBox(
            height: AppSizes.spaceBetweenSections,
          ),

          AppUserReviewCard(),
          AppUserReviewCard(),
          AppUserReviewCard(),
          AppUserReviewCard(),
          AppUserReviewCard(),
          AppUserReviewCard(),
        ]),
      )),
    );
  }
}

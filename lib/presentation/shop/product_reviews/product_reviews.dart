import 'package:dona/common/widgets/appbar/appbar.dart';
import 'package:dona/common/widgets/product/ratings/RatingBarIndicator.dart';
import 'package:dona/presentation/shop/product_reviews/widgets/rating_progress_indicator_group.dart';
import 'package:dona/presentation/shop/product_reviews/widgets/user_review_card.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

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
          const AppRatingBarIndicator(
            rating: 3.5,
          ),
          Text(
            "2032",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            height: AppSizes.spaceBetweenSections,
          ),

          const AppUserReviewCard(),
          const AppUserReviewCard(),
          const AppUserReviewCard(),
          const AppUserReviewCard(),
          const AppUserReviewCard(),
          const AppUserReviewCard(),
        ]),
      )),
    );
  }
}

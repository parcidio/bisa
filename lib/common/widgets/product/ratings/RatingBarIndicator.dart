import 'package:dona/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

class AppRatingBarIndicator extends StatelessWidget {
  const AppRatingBarIndicator({
    super.key,
    required this.rating,
  });

  final double rating;
  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemBuilder: (_, __) => const Icon(
        Iconsax.star1,
        color: AppColors.primary,
      ),
      itemCount: 5,
      itemSize: 20,
      unratedColor: AppColors.grey,
    );
  }
}

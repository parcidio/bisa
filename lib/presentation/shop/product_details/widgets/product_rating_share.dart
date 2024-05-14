import 'package:dona/utils/constants/colors.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

class AppRatingShare extends StatelessWidget {
  const AppRatingShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          // Rating
          children: [
         RatingBar(
   initialRating: 3.5,
   direction: Axis.horizontal,
   allowHalfRating: true,
   itemCount: 5,
   itemSize: AppSizes.iconSm,
   ratingWidget: RatingWidget(
     full: Icon(CupertinoIcons.star_fill, color: AppColors.secondary),
     half: Icon(CupertinoIcons.star_lefthalf_fill, color: AppColors.secondary),
     empty: Icon(CupertinoIcons.star, color: AppColors.secondary),
   ),
   itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
   onRatingUpdate: (rating) {
     print(rating);
   },
),
            const SizedBox(
              width: AppSizes.spaceBetweenItems / 2,
            ),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: '4.6', style: Theme.of(context).textTheme.bodyLarge),
               TextSpan(text: ' (203 revisão)', style: Theme.of(context).textTheme.labelLarge)
            ])),
          ],
        ),
       
      ],
    );
  }
}

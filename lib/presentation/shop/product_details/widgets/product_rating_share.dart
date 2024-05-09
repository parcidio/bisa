import 'package:dona/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
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
            const Icon(
              Iconsax.star5,
              color: Colors.amber,
              size: 24,
            ),
            const SizedBox(
              width: AppSizes.spaceBetweenItems / 2,
            ),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: '5.0', style: Theme.of(context).textTheme.bodyLarge),
              const TextSpan(text: '(203)')
            ])),
          ],
        ),
        // Share button
        IconButton(
          onPressed: () {},
          icon: const Icon(Iconsax.share, size: AppSizes.iconMd),
        )
      ],
    );
  }
}

import 'package:dona/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/magazine.dart';

class MagazineCoverImage extends StatelessWidget {
  const MagazineCoverImage({
    super.key,
    this.height,
    required this.image,
  });

  final String image;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: AspectRatio(
        aspectRatio: .80,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.white,
            image: DecorationImage(
              image: NetworkImage(image),
              fit: BoxFit.cover,
            ),
            boxShadow: const [
              BoxShadow(
                color: AppColors.black,
                blurRadius: 20,
                offset: Offset(0, 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:dona/common/widgets/layouts/grid_layout.dart';
import 'package:dona/common/widgets/product/product_card/product_card_vertical.dart';
import 'package:dona/common/widgets/text/section_heading.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../utils/constants/colors.dart';

class AppCategoryTab extends StatefulWidget {
  const AppCategoryTab({
    super.key,
    required this.products,
  });

  final List<dynamic> products;

  @override
  State<AppCategoryTab> createState() => _AppCategoryTabState();
}

class _AppCategoryTabState extends State<AppCategoryTab> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              const AppSectionHeading(
                title: 'Os produtos da praça',
                buttonTitle: 'Filtrar',
                buttonIcon: CupertinoIcons.search,
                isSmall: true,
                textColor: AppColors.darkGrey,
              ),
              AppGridLayout(
                itemCount: widget.products.length,
                itemCountRow: 3,
                itemBuilder: (context, index) {
                  final product = widget.products[index];

                  // Extract the first image URL from the array
                  final imageUrls = product['image_url'] as List<dynamic>?;
                  final firstImageUrl = imageUrls?.isNotEmpty == true
                      ? imageUrls!.first.toString()
                      : '';
                  Logger logger = Logger();
                  logger.i('Product: ${product['name']}');
                  logger.i('First Image URL: $firstImageUrl');

                  return AppProductCardVertical(
                    productId: product["id"],
                    name: product['mean_description'],
                    price: double.parse(product['price'].toString()),
                    rate: product['rating'],
                    description: product['mean_description'],
                    // priceWas: product['rating'],
                    place: product['tags'],
                    unit: product['unit'],
                    imageUrl: firstImageUrl, // Use the first image URL
                    product: product,
                  );
                },
              ),
              const SizedBox(
                height: AppSizes.spaceBetweenSections,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

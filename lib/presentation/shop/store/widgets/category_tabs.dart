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
    this.brandIcon,
    required this.brandName,
    required this.brandDetail,
  });

  final String brandName, brandDetail;
  final String? brandIcon;

  @override
  State<AppCategoryTab> createState() => _AppCategoryTabState();
}

class _AppCategoryTabState extends State<AppCategoryTab> {
  final _future = Supabase.instance.client
      .from('product')
      .select('*')
      .eq('is_active', true);

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
              FutureBuilder(
                future: _future,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                        strokeWidth: AppSizes.xs,
                      ),
                    );
                  }
                  Logger logger = Logger();
                  final products = snapshot.data as List<dynamic>;

                  logger.i("===============================================");
                  logger.i(products);

                  return AppGridLayout(
                    itemCount: products.length,
                    itemCountRow: 3,
                    itemBuilder: (context, index) {
                      final product = products[index];

                      // Extract the first image URL from the array
                      final imageUrls = product['image_url'] as List<dynamic>?;
                      final firstImageUrl = imageUrls?.isNotEmpty == true
                          ? imageUrls!.first.toString()
                          : '';

                      logger.i('Product: ${product['name']}');
                      logger.i('First Image URL: $firstImageUrl');

                      return AppProductCardVertical(
                        productId: product["id"],
                        name: product['name'],
                        price: double.parse(product['price'].toString()),
                        rate: product['rating'],
                        description: product['mean_description'],
                        priceWas: product['rating'],
                        place: product['tags'],
                        unit: product['unit'],
                        imageUrl: firstImageUrl, // Use the first image URL
                        product: product,
                      );
                    },
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

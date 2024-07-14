import 'package:flutter/material.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:dona/utils/helpers/helper_functions.dart';


class AppBottomAddToCart extends StatelessWidget {
  const AppBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = AppHelperFuncions.isDarkMode(context);
    List<Map<String, String>> calculations = [
      {"title": "Total", "amount": "25700.00 kz"},
      {"title": "Sub Total", "amount": "+25000.00 kz"},
      {"title": "Entrega", "amount": "+1200.00 kz"},
      {"title": "Disconto", "amount": "-500.00 kz"},
      {"title": "Esquebra", "amount": "0.4kg de tomate"},
    ];

    return Padding(
      padding: const EdgeInsets.all(AppSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: const Center(
              child: Text(
                'Proceguir',
              ),
            ),
          ),
          const SizedBox(height: AppSizes.spaceBetweenSections / 2),
          SizedBox(
            height: 160, // Adjust the height as needed
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: calculations.length,
              itemBuilder: (_, index) {
                final calculation = calculations[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          calculation["title"]!,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        Text(calculation["amount"]!,
                            style: Theme.of(context).textTheme.labelMedium),
                      ],
                    ),
                    const Divider()
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

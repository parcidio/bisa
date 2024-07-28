import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class AppProductDescription extends StatelessWidget {
  const AppProductDescription({
    super.key,
    required this.description,
    required this.otherproperties,
  });

  final String description;
  final Map<String, dynamic> otherproperties;

  @override
  Widget build(BuildContext context) {
    // Flatten the nested JSON structure
    Map<String, String> flattenedProperties = _flattenJson(otherproperties);

    return SizedBox(
      width: 450,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppSizes.spaceBetweenItems),
          Text('Descrição', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: AppSizes.spaceBetweenItems / 2),
          ReadMoreText(
            description,
            trimLines: 2,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Mais',
            trimExpandedText: 'Menos',
            lessStyle:
                const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
            moreStyle:
                const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: AppSizes.spaceBetweenItems),
          // if (flattenedProperties.isNotEmpty)
          //   ClipRRect(
          //     borderRadius: BorderRadius.circular(AppSizes.cardRadiusSm),
          //     child: Container(
          //       alignment: Alignment.centerLeft,
          //       color: AppColors.softGrey,
          //       child: Table(
          //         border: const TableBorder.symmetric(
          //           inside: BorderSide(width: 1, color: AppColors.darkGrey),
          //         ),
          //         children: flattenedProperties.entries
          //             .map(
          //               (property) => TableRow(children: [
          //                 Padding(
          //                   padding: const EdgeInsets.all(8.0),
          //                   child: Text(property.key,
          //                       style: Theme.of(context).textTheme.bodyMedium),
          //                 ),
          //                 Padding(
          //                   padding: const EdgeInsets.all(8.0),
          //                   child: Text(property.value,
          //                       style: Theme.of(context).textTheme.bodyMedium),
          //                 )
          //               ]),
          //             )
          //             .toList(),
          //       ),
          //     ),
          //   ),
        ],
      ),
    );
  }

  // Helper function to flatten a nested JSON structure
  Map<String, String> _flattenJson(Map<String, dynamic> json,
      [String prefix = '']) {
    Map<String, String> flatMap = {};

    json.forEach((key, value) {
      String newKey = prefix.isEmpty ? key : '$prefix ($key)';

      if (value is Map<String, dynamic>) {
        // flatMap.addAll(_flattenJson(value, newKey));
      } else if (value is List) {
        // for (int i = 0; i < value.length; i++) {
        //   flatMap.addAll(_flattenJson({'$newKey[$i]': value[i]}, ''));
        // }
      } else {
        flatMap[newKey] = value.toString();
      }
    });

    return flatMap;
  }
}

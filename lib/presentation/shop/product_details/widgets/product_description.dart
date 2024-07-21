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
  final List<Object> otherproperties;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(height: AppSizes.spaceBetweenItems),
      Text('Descricao', style: Theme.of(context).textTheme.titleMedium),
      const SizedBox(
        height: AppSizes.spaceBetweenItems / 2,
      ),
      ReadMoreText(
        description,
        trimLines: 2,
        trimMode: TrimMode.Line,
        trimCollapsedText: 'Mais',
        trimExpandedText: 'Menos',
        lessStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
        moreStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
      ),
      const SizedBox(
        height: AppSizes.spaceBetweenItems,
      ),
      otherproperties.isEmpty == false
          ? ClipRRect(
              borderRadius: BorderRadius.circular(
                  AppSizes.cardRadiusSm), // Adjust the radius as needed

              child: Container(
                  alignment: Alignment.centerLeft,
                  color: AppColors.softGrey,
                  child: Table(
                    border: const TableBorder.symmetric(
                        inside:
                            BorderSide(width: 1, color: AppColors.darkGrey)),
                    children: otherproperties
                        .map(
                          (property) => const TableRow(children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("otherproperties[0]"),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('24'),
                            )
                          ]),
                        )
                        .toList(),
                  )),
            )
          : const SizedBox(),
    ]);
  }
}

import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class AppProductDescription extends StatelessWidget {
  const AppProductDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(height: AppSizes.spaceBetweenItems),
      Text('Descricao', style: Theme.of(context).textTheme.titleMedium),
      const SizedBox(
        height: AppSizes.spaceBetweenItems / 2,
      ),
      const ReadMoreText(
        'This method will save memory by building items once it becomes necessary. This way they won\'t be built if they\'re not currently meant to be visible on screen. It can be used to build different child item widgets related to content or by item index.',
        trimLines: 2,
        trimMode: TrimMode.Line,
        trimCollapsedText: 'Mais',
        trimExpandedText: 'Menos',
        lessStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
        moreStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
      ),
      const SizedBox(
        height: AppSizes.spaceBetweenItems,
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(
            AppSizes.cardRadiusSm), // Adjust the radius as needed

        child: Container(
            alignment: Alignment.centerLeft,
            color: AppColors.softGrey,
            child: Table(
              border: const TableBorder.symmetric(
                  inside: BorderSide(width: 1, color: AppColors.darkGrey)),
              children: const [
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Unidades'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('24'),
                  )
                ]),
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Set'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Grade'),
                  )
                ]),
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Peso'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('12KG'),
                  )
                ]),
              ],
            )),
      ),
    ]);
  }
}

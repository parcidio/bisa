import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

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
    ]);
  }
}

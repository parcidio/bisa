import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

class LeadTimeCard extends StatelessWidget {
  final int quantity;
  final int dispatchDays;
  final int deliveryDays;

  const LeadTimeCard({super.key, 
    required this.quantity,
    required this.dispatchDays,
    required this.deliveryDays,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(),
          Text('Cronograma de entregas para $quantity items',
              style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(height: AppSizes.spaceBetweenItems / 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(right: AppSizes.spaceBetweenItems),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Despacho',
                        style: Theme.of(context).textTheme.labelLarge),
                    const SizedBox(height: 4.0),
                    Text('$dispatchDays dias',
                        style: Theme.of(context).textTheme.labelMedium),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Entrega',
                      style: Theme.of(context).textTheme.labelLarge),
                  const SizedBox(height: 4.0),
                  Text('$deliveryDays dias',
                      style: Theme.of(context).textTheme.labelMedium),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

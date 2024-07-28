import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/flat_cards/leadtime_flat_card.dart';
import '../../../../utils/constants/colors.dart';

class ShippingInfoDetails extends StatelessWidget {
  const ShippingInfoDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(.2),
            border: Border(
              top: BorderSide(
                  color: AppColors.primary.withOpacity(.5), width: 2.0),
              bottom: BorderSide(
                  color: AppColors.primary.withOpacity(.5), width: 2.0),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    CupertinoIcons.cube_box,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 8.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: ' Frete para ',
                            style:
                                Theme.of(context).textTheme.bodyMedium!.apply(
                                      color: AppColors.primary,
                                    )),
                        TextSpan(
                            text: ' Benguela ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .apply(
                                    color: AppColors.primary,
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColors.primary)),
                      ])),
                      Text(' 5046.65 KZ ',
                          style: Theme.of(context).textTheme.bodyMedium!.apply(
                                color: AppColors.primary,
                              ))
                    ],
                  ),
                ],
              ),
              const Icon(
                CupertinoIcons.right_chevron,
                color: Colors.black,
              ),
            ],
          ),
        ),
        const LeadTimeCard(
          deliveryDays: 3,
          dispatchDays: 0,
          quantity: 2,
        ),
        const Divider(),
      ],
    );
  }
}

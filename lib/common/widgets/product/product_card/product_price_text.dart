import 'package:dona/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class AppProductPriceText extends StatelessWidget {
  const AppProductPriceText(
      {super.key,
      this.currencySign = 'kz',
      required this.price,
      this.priceWas = 00,
      this.unit = '',
      this.maxLines = 1,
      this.isSmall = false,
      this.lineThrough = true});

  final String currencySign, unit;
  final double price, priceWas;
  final int maxLines;
  final bool isSmall, lineThrough;

  @override
  Widget build(BuildContext context) {
    List<int> separateMoneyAndCents(double value) {
      int money = value.floor();
      int cents = ((value - money) * 100).round();
      return [money, cents];
    }

    var resultPrice = separateMoneyAndCents(price);
    var resultPriceWas = separateMoneyAndCents(priceWas);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        price > 0
            ? RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "$currencySign ${resultPrice[0]}",
                      style: isSmall
                          ? Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .apply(color: AppColors.primary)
                          : Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .apply(color: AppColors.primary),
                    ),
                    TextSpan(
                      text: resultPrice[1] != 0 ? ',${resultPrice[1]}' : ',00',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    TextSpan(
                      text: unit.trim() == '' ? '' : '/$unit',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
                maxLines: maxLines,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              )
            : Text('Sobre consulta',
                style: Theme.of(context).textTheme.headlineMedium!.apply(
                      color: AppColors.primary,
                    )),
        if (priceWas != 0) ...[
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '$currencySign ${resultPriceWas[0]}',
                  style: isSmall
                      ? Theme.of(context).textTheme.labelSmall!.apply(
                          color: AppColors.primary,
                          decoration:
                              lineThrough ? TextDecoration.lineThrough : null)
                      : Theme.of(context).textTheme.labelSmall!.apply(
                          color: AppColors.primary,
                          decoration:
                              lineThrough ? TextDecoration.lineThrough : null),
                ),
                TextSpan(
                  text:
                      resultPriceWas[1] != 0 ? ',${resultPriceWas[1]}' : ',00',
                  style: isSmall
                      ? Theme.of(context).textTheme.labelMedium!.apply(
                          decoration:
                              lineThrough ? TextDecoration.lineThrough : null)
                      : Theme.of(context).textTheme.labelMedium!.apply(
                          decoration:
                              lineThrough ? TextDecoration.lineThrough : null),
                ),
                TextSpan(
                  text: unit.trim() == '' ? '' : '/$unit',
                  style: isSmall
                      ? Theme.of(context).textTheme.labelMedium!.apply(
                          decoration:
                              lineThrough ? TextDecoration.lineThrough : null)
                      : Theme.of(context).textTheme.labelMedium!.apply(
                          decoration:
                              lineThrough ? TextDecoration.lineThrough : null),
                ),
              ],
            ),
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ],
      ],
    );
  }
}

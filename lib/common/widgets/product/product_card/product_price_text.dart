import 'package:flutter/material.dart';

class AppProductPriceText extends StatelessWidget {
  const AppProductPriceText(
      {super.key,
      this.currencySign = 'kz',
      required this.price,
      this.priceWas = 00,
      this.unit = '',
      this.maxLines = 1,
      this.isLarge = false,
      this.lineThrough = true});

  final String currencySign, unit;
  final double price, priceWas;
  final int maxLines;
  final bool isLarge, lineThrough;

  @override
  Widget build(BuildContext context) {
    List<int> separateMoneyAndCents(double value) {
      int money = value.floor();
      int cents = ((value - money) * 100).round();
      return [money, cents];
    }

    var resultPrice = separateMoneyAndCents(price as double);
    var resultPriceWas = separateMoneyAndCents(priceWas as double);
    return Column(
      children: [
        Row(
          children: [
            Text("$currencySign ${resultPrice[0]}",
                maxLines: maxLines,
                overflow: TextOverflow.ellipsis,
                style: isLarge
                    ? Theme.of(context).textTheme.titleLarge
                    : Theme.of(context).textTheme.titleMedium),
            Text(
              resultPrice[1] != 0 ? ',${resultPrice[1]}' : ',00',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Text(
              unit.trim() == '' ? '' : '/$unit',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
        if (priceWas != 0) ...[
          Row(
            children: [
              Text('$currencySign ${resultPriceWas[0]}',
                  maxLines: maxLines,
                  overflow: TextOverflow.ellipsis,
                  style: isLarge
                      ? Theme.of(context).textTheme.labelSmall!.apply(
                          decoration:
                              lineThrough ? TextDecoration.lineThrough : null)
                      : Theme.of(context).textTheme.labelSmall!.apply(
                          decoration:
                              lineThrough ? TextDecoration.lineThrough : null)),
              Text(
                resultPriceWas[1] != 0 ? ',${resultPriceWas[1]}' : ',00',
                style: isLarge
                    ? Theme.of(context).textTheme.labelMedium!.apply(
                        decoration:
                            lineThrough ? TextDecoration.lineThrough : null)
                    : Theme.of(context).textTheme.labelMedium!.apply(
                        decoration:
                            lineThrough ? TextDecoration.lineThrough : null),
              ),
              Text(
                unit.trim() == '' ? '' : '/$unit',
                style: isLarge
                    ? Theme.of(context).textTheme.labelMedium!.apply(
                        decoration:
                            lineThrough ? TextDecoration.lineThrough : null)
                    : Theme.of(context).textTheme.labelMedium!.apply(
                        decoration:
                            lineThrough ? TextDecoration.lineThrough : null),
              ),
            ],
          ),
        ],
      ],
    );
  }
}

// lib/weight_selector_bottom_sheet.dart
import 'package:animated_weight_picker/animated_weight_picker.dart';

import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../product/product_card/product_card_simple.dart';

class WeightSelectorBottomSheet extends StatefulWidget {
  final double pricePerUnit;
  final String unit;
  final String name;
  final String imageUrl;

  const WeightSelectorBottomSheet(
      {Key? key,
      required this.pricePerUnit,
      required this.unit,
      required this.imageUrl,
      required this.name})
      : super(key: key);

  @override
  _WeightSelectorBottomSheetState createState() =>
      _WeightSelectorBottomSheetState();
}

class _WeightSelectorBottomSheetState extends State<WeightSelectorBottomSheet> {
  final double min = 1;
  final double max = 50;
  String selectedValue = '';
  late double price;

  @override
  void initState() {
    selectedValue = min.toString();
    price = widget.pricePerUnit;
    super.initState();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
        height: 300,
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: Center(
          child: Column(
            children: [
              AppProductSimpleCard(
                imageUrl: widget.imageUrl,
                price: widget.pricePerUnit,
                totalPrice: price,
                name: widget.name,
                unit: widget.unit,
              ),
              const SizedBox(
                height: AppSizes.spaceBetweenSections,
              ),
              SizedBox(
                width: 500,
                child: AnimatedWeightPicker(
                  dialColor: AppColors.primary,
                  showSuffix: true,
                  suffixText: widget.unit,
                  suffixTextColor: AppColors.darkGrey,
                  squeeze: 3,
                  division: .1,
                  selectedValueColor: AppColors.primary,
                  min: min,
                  max: max,
                  onChange: (newValue) {
                    setState(() {
                      selectedValue = newValue;
                      price = widget.pricePerUnit * double.parse(selectedValue);
                    });
                  },
                ),
              ),
            ],
          ),
        ));
  }
}

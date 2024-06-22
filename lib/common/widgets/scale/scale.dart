// lib/weight_selector_bottom_sheet.dart
import 'package:animated_weight_picker/animated_weight_picker.dart';
import 'package:dona/utils/theme/custom_themes/text_theme.dart';

import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class WeightSelectorBottomSheet extends StatefulWidget {
  final double pricePerKg;

  const WeightSelectorBottomSheet({Key? key, required this.pricePerKg})
      : super(key: key);

  @override
  _WeightSelectorBottomSheetState createState() =>
      _WeightSelectorBottomSheetState();
}

class _WeightSelectorBottomSheetState extends State<WeightSelectorBottomSheet> {
  final double min = 1;
  final double max = 50;
  String selectedValue = '';

  @override
  void initState() {
    selectedValue = min.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                width: 500,
                child: AnimatedWeightPicker(
                  dialColor: AppColors.primary,
                  suffixTextColor: AppColors.darkGrey,
                  squeeze: 3,
                  division: .1,
                  majorIntervalColor: AppColors.secondary,
                  majorIntervalTextColor: AppColors.secondary,
                  selectedValueColor: AppColors.primary,
                  min: min,
                  max: max,
                  onChange: (newValue) {
                    setState(() {
                      selectedValue = newValue;
                    });
                  },
                ),
              ),
            ],
          ),
        ));
  }
}

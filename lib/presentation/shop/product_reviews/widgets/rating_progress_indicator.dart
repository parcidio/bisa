import 'package:dona/utils/constants/colors.dart';
import 'package:dona/utils/device/device._utility.dart';
import 'package:flutter/material.dart';

class AppRatingProgressIndicator extends StatelessWidget {
  const AppRatingProgressIndicator({
    super.key,
    required this.value,
    required this.text,
  });

  final double value;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 7,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Expanded(
                  flex: 11,
                  child: SizedBox(
                    width: AppDeviceUtils.getScreenWidth(context) * .8,
                    child: LinearProgressIndicator(
                      value: value,
                      minHeight: 10,
                      backgroundColor: AppColors.primary,
                      borderRadius: BorderRadius.circular(5),
                      valueColor: const AlwaysStoppedAnimation(AppColors.grey),
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}

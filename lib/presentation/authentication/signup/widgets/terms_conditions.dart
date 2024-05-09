import 'package:dona/utils/constants/colors.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:dona/utils/constants/text_strings.dart';
import 'package:dona/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TermsAndConditionCheckBox extends StatelessWidget {
  const TermsAndConditionCheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = AppHelperFuncions.isDarkMode(context);

    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            value: true,
            onChanged: (value) {},
          ),
        ),
        const SizedBox(
          width: AppSizes.spaceBetweenItems,
        ),
        Text.rich(TextSpan(children: [
          TextSpan(
              text: '${AppTexts.iAgreeToo} ',
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: '${AppTexts.privacyPolicy} ',
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: isDarkMode ? AppColors.white : AppColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor:
                      isDarkMode ? AppColors.white : AppColors.primary)),
          TextSpan(
              text: '${AppTexts.and} ',
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: '${AppTexts.termsOfUse} ',
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: isDarkMode ? AppColors.white : AppColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor:
                      isDarkMode ? AppColors.white : AppColors.primary)),
        ])),
      ],
    );
  }
}

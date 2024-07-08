import 'package:dona/utils/constants/colors.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:dona/utils/constants/text_strings.dart';
import 'package:dona/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsAndConditionCheckBox extends StatelessWidget {
  const TermsAndConditionCheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = AppHelperFuncions.isDarkMode(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppTexts.iAgreeToo,
              style: TextStyle(
                fontSize: 12,
                decoration: TextDecoration.none,
                color: AppColors.darkGrey,
              ),
            ),
            TextButton(
                onPressed: () => Get.to(() => ()),
                child: const Text(
                  AppTexts.termsOfUse,
                  style: TextStyle(
                    fontSize: 12,
                    decoration: TextDecoration.underline,
                    color: AppColors.primary,
                  ),
                )),
          ],
        ),
      ],
    );
  }
}

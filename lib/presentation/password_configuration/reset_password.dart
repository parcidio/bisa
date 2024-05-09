import 'package:dona/common/styles/spacinng_styles.dart';
import 'package:dona/utils/constants/image_strings.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:dona/utils/constants/text_strings.dart';
import 'package:dona/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: AppSpacingStyle.paddingWithAppHeidth * 2,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //  Image
                  Image(
                    image:
                        const AssetImage(AppImages.workInProgressIllustration),
                    width: AppHelperFuncions.screenWidth() * 0.6,
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBetweenSections,
                  ),
                  // Title & Sibtitle
                  Text(
                    AppTexts.changeYourPasswordTitle,
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBetweenItems,
                  ),

                  Text(
                    AppTexts.changeYourPasswordSubtile,
                    style: Theme.of(context).textTheme.labelMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBetweenSections,
                  ),

                  // Buttons
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(AppTexts.done),
                    ),
                  ),

                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(AppTexts.resentEmail),
                    ),
                  ),
                ])),
      ),
    );
  }
}

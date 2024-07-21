import 'package:dona/common/widgets/success_screen/success_screen.dart';
import 'package:dona/presentation/authentication/login/login.dart';
import 'package:dona/utils/constants/image_strings.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:dona/utils/constants/text_strings.dart';
import 'package:dona/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/otp_form.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => const LoginScreen()),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        // padding will provide an equal guard spacing to all screen
        child: Padding(
            padding: const EdgeInsets.all(AppSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //  Image
                Image(
                  image: const AssetImage(AppImages.productIllustration),
                  width: AppHelperFuncions.screenWidth() * 0.7,
                ),
                const SizedBox(
                  height: AppSizes.spaceBetweenSections,
                ),
                // Title & Sibtitle
                Text(
                  AppTexts.confirmEmailTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: AppSizes.spaceBetweenItems,
                ),
                Text(
                  'parcidioandre@gmail.com',
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: AppSizes.spaceBetweenItems,
                ),
                Text(
                  AppTexts.confirmationEmailSubtitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: AppSizes.spaceBetweenSections,
                ),
                OTPForm(),
                // Buttons

                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(AppTexts.resentEmail),
                  ),
                )
              ],
            )),
      ),
    );
  }
}

import 'package:dona/presentation/password_configuration/reset_password.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:dona/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //  Heading
            Text(
              AppTexts.forgetPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: AppSizes.spaceBetweenItems,
            ),
            Text(
              AppTexts.forgetPasswordSubtitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: AppSizes.spaceBetweenSections,
            ),
            // Textfield
            TextFormField(
              decoration: const InputDecoration(
                  labelText: AppTexts.email,
                  prefixIcon: Icon(Iconsax.direct_right)),
            ),
            const SizedBox(
              height: AppSizes.spaceBetweenSections,
            ),

            // Submit Buttons
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => Get.off(() => const ResetPasswordScreen()),
                  child: const Text(AppTexts.submit)),
            ),
          ])),
    );
  }
}

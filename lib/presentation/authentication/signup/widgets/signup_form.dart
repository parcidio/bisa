import 'package:dona/presentation/authentication/signup/verify_email.dart';
import 'package:dona/presentation/authentication/signup/widgets/terms_conditions.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:dona/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: TextFormField(
                expands: false,
                decoration: const InputDecoration(
                    labelText: AppTexts.firstName,
                    prefixIcon: Icon(Iconsax.user)),
              )),
              const SizedBox(
                width: AppSizes.spaceBetweenInputFields,
              ),
              Expanded(
                  child: TextFormField(
                expands: false,
                decoration: const InputDecoration(
                    labelText: AppTexts.lastName,
                    prefixIcon: Icon(Iconsax.user)),
              )),
            ],
          ),
          // Email
          const SizedBox(
            height: AppSizes.spaceBetweenInputFields,
          ),
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
                labelText: AppTexts.email, prefixIcon: Icon(Iconsax.direct)),
          ),
          // Phone Number
          const SizedBox(
            height: AppSizes.spaceBetweenInputFields,
          ),
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
                labelText: AppTexts.phoenNo, prefixIcon: Icon(Iconsax.call)),
          ),
          // Password

          const SizedBox(
            height: AppSizes.spaceBetweenInputFields,
          ),
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
                labelText: AppTexts.password,
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: Icon(Iconsax.eye_slash)),
          ),
          const SizedBox(
            height: AppSizes.spaceBetweenInputFields,
          ),

          // Terms and conditions checkbox
          const TermsAndConditionCheckBox(),
          const SizedBox(
            height: AppSizes.spaceBetweenInputFields,
          ),
          // Signup Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => Get.to(() => const VerifyEmailScreen()),
                child: const Text(AppTexts.createAccount)),
          )
        ],
      ),
    );
  }
}

import 'package:dona/navigation_menu.dart';
import 'package:dona/presentation/authentication/signup/signup.dart';
import 'package:dona/presentation/password_configuration/forget_password.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:dona/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
      padding:
          const EdgeInsets.symmetric(vertical: AppSizes.spaceBetweenSections),
      child: Column(
        children: [
          // Email
          TextFormField(
            decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: AppTexts.email),
          ),
          const SizedBox(
            height: AppSizes.spaceBetweenInputFields,
          ),
          // Password
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.password_check),
              labelText: AppTexts.password,
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),
          const SizedBox(
            height: AppSizes.spaceBetweenInputFields / 2,
          ),
          // Remenber me & Forget password
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Remember me
              Row(
                children: [
                  Checkbox(value: true, onChanged: (value) {}),
                  const Text(AppTexts.remenberMe)
                ],
              ),
              // Forget password
              TextButton(
                  onPressed: () => Get.to(() => const ForgetPasswordScreen()),
                  child: const Text(AppTexts.forgotPassword)),
            ],
          ),
          const SizedBox(height: AppSizes.spaceBetweenSections),
          // Sign in button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => Get.to(() => const NavigationMenu()),
                child: const Text(AppTexts.signIn)),
          ),
          const SizedBox(height: AppSizes.spaceBetweenItems),

          // Create account button
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
                onPressed: () => Get.to(() => const SignupScreen()),
                child: const Text(AppTexts.createAccount)),
          ),
        ],
      ),
    ));
  }
}

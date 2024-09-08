import 'package:dona/common/widgets/login_signup/social_buttons.dart';
import 'package:dona/navigation_menu.dart';
import 'package:dona/presentation/password_configuration/forget_password.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:dona/utils/constants/text_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/textfield/textfield.dart';
import '../../../../controllers/login_controller.dart';
import '../../../../utils/constants/colors.dart';
import '../../signup/signup.dart';

class LoginForm extends StatelessWidget {
  final SignupController _controller = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
      padding:
          const EdgeInsets.symmetric(vertical: AppSizes.spaceBetweenSections),
      child: Column(
        children: [
          // Email

          AppTextField(
            hintText: AppTexts.email,
            icon: CupertinoIcons.mail,
            onChanged: (value) => _controller.updateEmail(value),
          ),
          const SizedBox(
            height: AppSizes.spaceBetweenInputFields / 2,
          ),
          const SizedBox(
            height: AppSizes.spaceBetweenInputFields / 2,
          ),
          // Password
          AppTextField(
            hintText: AppTexts.password,
            icon: CupertinoIcons.lock,
            iconSuffix: CupertinoIcons.eye_slash,
            isObscure: true,
            onChanged: (value) => _controller.updatePassword(value),
          ),

          // Remenber me & Forget password
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Forget password
              TextButton(
                  onPressed: () => Get.to(() => const ForgetPasswordScreen()),
                  child: const Text(
                    AppTexts.forgotPassword,
                    style: TextStyle(
                      fontSize: 12,
                      decoration: TextDecoration.underline,
                      color: AppColors.darkGrey,
                    ),
                  )),
            ],
          ),
          const SizedBox(height: AppSizes.spaceBetweenSections),
          // Sign in button
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () async => await _controller.login(),
                  child: const Text(AppTexts.signIn))),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                AppTexts.signUpCall,
                style: TextStyle(
                  fontSize: 12,
                  decoration: TextDecoration.none,
                  color: AppColors.darkGrey,
                ),
              ),
              TextButton(
                  onPressed: () => Get.to(() => const SignupScreen()),
                  child: const Text(
                    AppTexts.signUp,
                    style: TextStyle(
                      fontSize: 12,
                      decoration: TextDecoration.underline,
                      color: AppColors.primary,
                    ),
                  )),
            ],
          ),

          const SizedBox(height: AppSizes.spaceBetweenItems),
          FormDivider(text: AppTexts.orSignInWith.capitalize!),
          const SizedBox(height: AppSizes.spaceBetweenItems),
          // Create account button
          const SocialButtons()
        ],
      ),
    ));
  }
}

import 'package:dona/presentation/authentication/signup/signup.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:dona/utils/constants/text_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';
import '../../../../common/widgets/textfield/textfield.dart';
import '../../../../navigation_menu.dart';
import '../../../../utils/constants/colors.dart';
import '../../../password_configuration/forget_password.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
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
            AppTextField(
                hintText: AppTexts.firstName, icon: CupertinoIcons.person),
            // const SizedBox(
            //   height: AppSizes.spaceBetweenInputFields,
            // ),
            AppTextField(
                hintText: AppTexts.lastName, icon: CupertinoIcons.person),
            // const SizedBox(
            //   height: AppSizes.spaceBetweenInputFields,
            // ),
            AppTextField(
                hintText: AppTexts.phoenNo, icon: CupertinoIcons.phone),
            // const SizedBox(
            //   height: AppSizes.spaceBetweenInputFields,
            // ),

            AppTextField(hintText: AppTexts.email, icon: CupertinoIcons.mail),
            // const SizedBox(
            //   height: AppSizes.spaceBetweenInputFields,
            // ),

            // Password
            AppTextField(
              hintText: AppTexts.password,
              icon: CupertinoIcons.lock,
              iconSuffix: CupertinoIcons.eye_slash,
            ),

            //
            AppTextField(
              hintText: AppTexts.confirmPassword,
              icon: CupertinoIcons.lock,
              iconSuffix: CupertinoIcons.eye_slash,
            ),

            const SizedBox(height: AppSizes.spaceBetweenSections),
            // Sign in button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => Get.to(() => const NavigationMenu()),
                  child: const Text(AppTexts.signIn)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
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
            SocialButtons()
          ],
        ),
      ),
    );
  }
}

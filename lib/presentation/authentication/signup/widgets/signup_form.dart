import 'package:dona/presentation/authentication/login/login.dart';
import 'package:dona/presentation/authentication/signup/verify_email.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:dona/utils/constants/text_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';
import '../../../../common/widgets/textfield/textfield.dart';
import '../../../../controllers/signup_controller.dart';
import '../../../../utils/constants/colors.dart';

class SignUpForm extends StatelessWidget {
  final SignupController _controller = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: AppSizes.spaceBetweenSections),
        child: Column(
          children: [
            // Name
            AppTextField(
              hintText: AppTexts.Name,
              icon: CupertinoIcons.person,
              onChanged: (value) => _controller.updateName(value),
            ),
            // const SizedBox(
            //   height: AppSizes.spaceBetweenInputFields,
            // ),

            // Phone Number
            AppTextField(
              hintText: AppTexts.phoenNo,
              icon: CupertinoIcons.phone,
              onChanged: (value) => _controller.updatePhoneNumber(value),
            ),
            // const SizedBox(
            //   height: AppSizes.spaceBetweenInputFields,
            // ),

            // Email
            AppTextField(
              hintText: AppTexts.email,
              icon: CupertinoIcons.mail,
              onChanged: (value) => _controller.updateEmail(value),
            ),
            // const SizedBox(
            //   height: AppSizes.spaceBetweenInputFields,
            // ),

            // Password
            AppTextField(
              hintText: AppTexts.password,
              icon: CupertinoIcons.lock,
              isObscure: true,
              iconSuffix: CupertinoIcons.eye_slash,
              onChanged: (value) => _controller.updatePassword(value),
            ),

            // Confirm Password
            AppTextField(
              hintText: AppTexts.confirmPassword,
              isObscure: true,
              icon: CupertinoIcons.lock,
              iconSuffix: CupertinoIcons.eye_slash,
              onChanged: (value) => _controller.updateConfirmPassword(value),
            ),

            const SizedBox(height: AppSizes.spaceBetweenSections),
            // Sign up button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () async {
                    await _controller.signup();
                  },
                  child: const Text(AppTexts.signUp)),
            ),
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
                    onPressed: () => _controller.signup,
                    child: const Text(
                      AppTexts.signIn,
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
      ),
    );
  }
}

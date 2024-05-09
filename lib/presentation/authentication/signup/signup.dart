import 'package:dona/common/widgets/login_signup/form_divider.dart';
import 'package:dona/common/widgets/login_signup/social_buttons.dart';
import 'package:dona/presentation/authentication/signup/widgets/signup_form.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:dona/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(AppSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //  title
                Text(
                  AppTexts.signupTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: AppSizes.spaceBetweenSections,
                ),
                // Form
                const SignUpForm(),
                const SizedBox(
                  height: AppSizes.spaceBetweenInputFields,
                ),

                // Divider
                FormDivider(text: AppTexts.orSignUpWith.capitalize!),
                const SizedBox(
                  height: AppSizes.spaceBetweenSections,
                ),
                const SizedBox(
                  height: AppSizes.spaceBetweenInputFields,
                ),
                // Social Buttons
                const SocialButtons(),
              ],
            )),
      ),
    );
  }
}

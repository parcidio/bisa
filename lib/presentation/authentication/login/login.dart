import 'package:dona/common/styles/spacinng_styles.dart';
import 'package:dona/common/widgets/login_signup/form_divider.dart';
import 'package:dona/common/widgets/login_signup/social_buttons.dart';
import 'package:dona/presentation/authentication/login/widgets/login_form.dart';
import 'package:dona/presentation/authentication/login/widgets/login_header.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:dona/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: AppSpacingStyle.paddingWithAppHeidth,
            child: Column(
              children: [
                // logo, title and subtitle
                const LoginHeader(),
                // Form
                const LoginForm(),
                // Divider
                // FormDivider(text: AppTexts.orSignInWith.capitalize!),
                // const SizedBox(
                //   height: AppSizes.spaceBetweenSections,
                // ),
                // Footer
                // const SocialButtons()
              ],
            )),
      ),
    );
  }
}

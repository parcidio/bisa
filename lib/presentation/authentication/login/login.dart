import 'package:dona/common/styles/spacinng_styles.dart';
import 'package:dona/presentation/authentication/login/widgets/login_form.dart';
import 'package:dona/presentation/authentication/login/widgets/login_header.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: AppSpacingStyle.paddingWithAppHeidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // logo, title and subtitle
                LoginHeader(),
                // Form
                LoginForm(),
                //
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

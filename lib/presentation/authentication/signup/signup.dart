import 'package:dona/presentation/authentication/signup/widgets/signup_form.dart';
import 'package:dona/presentation/authentication/signup/widgets/signup_header.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import 'widgets/terms_conditions.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(AppSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //  title
                SignupHeader(),
                // Form
                SignUpForm(),
                SizedBox(
                  height: AppSizes.spaceBetweenInputFields,
                ),
                TermsAndConditionCheckBox()
              ],
            )),
      ),
    );
  }
}

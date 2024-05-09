import 'package:dona/utils/constants/image_strings.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:dona/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Image(
          image: AssetImage(AppImages.greenAppLogo),
          height: 150,
        ),
        Text(
          AppTexts.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: AppSizes.sm),
        Text(
          AppTexts.loginSubtitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}

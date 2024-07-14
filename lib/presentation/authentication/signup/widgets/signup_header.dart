import 'package:dona/utils/constants/sizes.dart';
import 'package:dona/utils/constants/text_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';


class SignupHeader extends StatelessWidget {
  const SignupHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              CupertinoIcons.arrow_left,
            )),
        Text(
          AppTexts.signupTitle,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(height: AppSizes.sm),
        Text(
          AppTexts.signupSubTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}

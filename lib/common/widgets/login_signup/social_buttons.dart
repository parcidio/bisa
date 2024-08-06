import 'package:dona/presentation/shop/store/store.dart';
import 'package:dona/utils/constants/colors.dart';
import 'package:dona/utils/constants/image_strings.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const List<String> scopes = <String>[
  'email',
  'https://www.googleapis.com/auth/contacts.readonly',
];
Logger logger = Logger();
GoogleSignIn _googleSignIn = GoogleSignIn(
  // Optional clientId
  // clientId: 'your-client_id.apps.googleusercontent.com',
  scopes: scopes,
);

class SocialButtons extends StatefulWidget {
  const SocialButtons({
    super.key,
  });

  @override
  State<SocialButtons> createState() => _SocialButtonsState();
}

final supabase = Supabase.instance.client;

class _SocialButtonsState extends State<SocialButtons> {
  String? _userId; //This ID will track the login state of the user
  void initState() {
    super.initState();
    supabase.auth.onAuthStateChange.listen((data) {
      setState(() {
        _userId = data.session?.user.id;

        logger.i(_userId);
        if (_userId == null) {
          Get.to(() => const StoreScreen());
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Future<void> handleSignIn() async {
      try {
        await _googleSignIn.signIn();
        setState(() {});
      } catch (error) {
        logger.e(error);
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => handleSignIn(),
            child: Container(
              padding: const EdgeInsets.all(AppSizes.spaceBetweenItems / 2.5),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.grey),
                  borderRadius: BorderRadius.circular(AppSizes.sm)),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppImages.googleLogo,
                      height: AppSizes.iconSm,
                      width: AppSizes.iconSm,
                    ),
                    Text("oogle")
                  ],
                ),
              ),
            ),
          ),
        ),
        // const SizedBox(
        //   width: AppSizes.spaceBetweenItems,
        // ),
        // Expanded(
        //   child: Container(
        //     padding: const EdgeInsets.all(AppSizes.spaceBetweenItems),
        //     decoration: BoxDecoration(
        //         border: Border.all(color: AppColors.grey),
        //         borderRadius: BorderRadius.circular(AppSizes.sm)),
        //     child: SvgPicture.asset(
        //       AppImages.facebookLogo,
        //       height: AppSizes.iconSm,
        //       width: AppSizes.iconSm,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}

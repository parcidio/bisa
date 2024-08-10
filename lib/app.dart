import 'package:dona/presentation/authentication/login/login.dart';
import 'package:dona/presentation/authentication/onboarding/onboarding.dart';
import 'package:dona/presentation/authentication/signup/signup_test.dart';
import 'package:dona/presentation/shop/store/store.dart';
import 'package:flutter/material.dart';
import 'package:dona/utils/theme/theme.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'presentation/authentication/login/login_test.dart';
import 'presentation/personalization/profile/profile_test.dart';

final supabase = Supabase.instance.client;

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Quitanda',
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      // home: const OnBoardingScreen(),
      // home: const LoginScreen(),
      home: const StoreScreen(),
      //   home: supabase.auth.currentSession == null
      //       ? const SignupPage()
      //       : const AccountPage(),
    );
  }
}

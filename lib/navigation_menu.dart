import 'package:dona/presentation/personalization/settings/settings.dart';
import 'package:dona/presentation/shop/favourite/favourite.dart';
import 'package:dona/presentation/shop/home/home.dart';
import 'package:dona/presentation/shop/store/store.dart';
import 'package:dona/utils/constants/colors.dart';
import 'package:dona/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = AppHelperFuncions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
            height: 80,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
            backgroundColor: darkMode ? AppColors.black : AppColors.white,
            indicatorShape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(4.0)),

            indicatorColor: darkMode
                ? AppColors.primary
                : AppColors.primary,
            destinations: const [     
              NavigationDestination( icon: Icon(CupertinoIcons.bag,  color: AppColors.black), label: 'Loja', selectedIcon: Icon(CupertinoIcons.bag, color: AppColors.white)),        
              NavigationDestination(icon: Icon(CupertinoIcons.grid, color: AppColors.black), label: 'Renda', selectedIcon: Icon(CupertinoIcons.grid, color: AppColors.white)),
            ]),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [ 
    const StoreScreen(),
    const SettingsScreen()
  ];
}

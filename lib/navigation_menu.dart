import 'package:dona/presentation/personalization/settings/settings.dart';
import 'package:dona/presentation/shop/store/store.dart';
import 'package:dona/utils/constants/colors.dart';
import 'package:dona/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = AppHelperFuncions.isDarkMode(context);
    Color iconColor = darkMode ? AppColors.white:AppColors.black;
    Color backgroundColor = darkMode ? AppColors.black : AppColors.white;

    return Scaffold(      
      bottomNavigationBar: Obx(
        () => NavigationBar(
            height: 80,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
            backgroundColor: backgroundColor,
            indicatorShape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(4.0)),

            indicatorColor: darkMode
                ? Colors.transparent
                : Colors.transparent,
            destinations:  [     
              NavigationDestination( icon: Icon(CupertinoIcons.bag,  color: iconColor ), label: 'Loja', selectedIcon: Icon(CupertinoIcons.bag_fill, color: AppColors.primary)),        
              NavigationDestination(icon: Icon(CupertinoIcons.tag, color: iconColor), label: 'Serviços', selectedIcon: Icon(CupertinoIcons.tag_fill, color: AppColors.primary)),
              NavigationDestination(icon: Icon(CupertinoIcons.gift, color: iconColor), label: 'Promoções', selectedIcon: Icon(CupertinoIcons.gift_fill, color: AppColors.primary)),
              NavigationDestination(icon: Icon(CupertinoIcons.text_bubble, color: iconColor), label: 'Bater papo', selectedIcon: Icon(CupertinoIcons.text_bubble_fill, color: AppColors.primary)),
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
    const SettingsScreen(),
    const SettingsScreen(),
    const SettingsScreen(),
  ];
}

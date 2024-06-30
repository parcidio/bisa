import 'package:dona/presentation/shop/map/map.dart';
import 'package:dona/presentation/shop/store/store.dart';
import 'package:dona/utils/constants/colors.dart';
import 'package:dona/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = AppHelperFuncions.isDarkMode(context);
    Color iconColor = darkMode ? AppColors.white : AppColors.black;
    Color backgroundColor = darkMode ? AppColors.black : AppColors.white;

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
            height: 60,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
            backgroundColor: backgroundColor,
            // indicatorShape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(4.0)),
            indicatorColor: darkMode ? Colors.transparent : Colors.transparent,
            destinations: [
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: NavigationDestination(
                    icon: Text('Praça',
                        style: TextStyle(
                          color: Colors.transparent,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                                color: AppColors.darkGrey,
                                offset: Offset(0, -6))
                          ],
                        )),
                    label: '',
                    selectedIcon: Text('Praça',
                        style: TextStyle(
                          color: Colors.transparent,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                                color: AppColors.black, offset: Offset(0, -6))
                          ],
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.dark,
                          decorationThickness: 4,
                        ))),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: NavigationDestination(
                    icon: Text('Bancadas',
                        style: TextStyle(
                          color: Colors.transparent,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                                color: AppColors.darkGrey,
                                offset: Offset(0, -6))
                          ],
                        )),
                    label: '',
                    selectedIcon: Text('Bancadas',
                        style: TextStyle(
                          color: Colors.transparent,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                                color: AppColors.black, offset: Offset(0, -6))
                          ],
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.dark,
                          decorationThickness: 4,
                        ))),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 20),
              //   child: NavigationDestination(
              //       icon: Text('Bancadas',
              //           style: TextStyle(
              //             color: Colors.transparent,
              //             fontWeight: FontWeight.bold,
              //             shadows: [
              //               Shadow(
              //                   color: AppColors.darkGrey,
              //                   offset: Offset(0, -10))
              //             ],
              //           )),
              //       label: '',
              //       selectedIcon: Text('Bancadas',
              //           style: TextStyle(
              //             color: Colors.transparent,
              //             fontWeight: FontWeight.bold,
              //             shadows: [
              //               Shadow(
              //                   color: AppColors.black, offset: Offset(0, -10))
              //             ],
              //             decoration: TextDecoration.underline,
              //             decorationColor: AppColors.dark,
              //             decorationThickness: 4,
              //           ))),
              // ),
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
    const MapScreen(),
    // const HomeScreen(),
  ];
}

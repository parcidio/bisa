import 'package:dona/presentation/authentication/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  // Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0
      .obs; // obs = observer -> this allows the state  to be changed on a stateless widget

  // Update current index when page scrolls
  void updatePageIndicator(index) => currentPageIndex.value = index;

  // Jumpin to specific dot selected page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  // Update current index and jump to the next page
  void nextPage() {
    if (currentPageIndex.value == 4) {
      Get.offAll(const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  // Update current index and jump to the last page
  void skipPage() {
    currentPageIndex.value = 4;
    pageController.jumpToPage(4);
  }
}

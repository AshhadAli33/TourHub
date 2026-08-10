import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();

  var pageIndex = 0.obs;

  void nextPage() {
    if (pageIndex.value < 2) {
      pageIndex.value++;
    }
  }

  void onPageChanged(int index) {
    pageIndex.value = index;
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}

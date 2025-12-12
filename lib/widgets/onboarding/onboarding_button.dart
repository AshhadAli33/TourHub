import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourhub/utils/app_colors.dart';
import 'package:tourhub/controllers/onboarding_controller.dart';

final OnboardingController controller = Get.find();

Widget buildBottomButton(PageController pageController, String btnText) {
  return ElevatedButton(
    onPressed: () {
      if (btnText == "Get Started") {
        Get.offNamed("/login");
      } else {
        pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.secondaryColor,
      elevation: 5,
      minimumSize: const Size(280, 50),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
    ),
    child: Text(
      btnText,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryColor,
      ),
    ),
  );
}

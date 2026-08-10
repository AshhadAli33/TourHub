import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourhub/utils/app_colors.dart';
import 'package:tourhub/controllers/onboarding/onboarding_controller.dart';

Widget buildBottomButton(OnboardingController controller, String btnText) {
  return ConstrainedBox(
    // Caps the button at 280 on normal screens (unchanged from before) but
    // lets it shrink instead of overflowing on very narrow viewports.
    constraints: const BoxConstraints(maxWidth: 280),
    child: SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          if (btnText == "Get Started") {
            Get.offNamed("/login");
          } else {
            controller.pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.secondaryColor,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: Text(
          btnText,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    ),
  );
}

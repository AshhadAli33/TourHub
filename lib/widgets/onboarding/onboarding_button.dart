import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourhub/utils/app_colors.dart';
import 'package:tourhub/controllers/onboarding/onboarding_controller.dart';

Widget buildBottomButton(
  OnboardingController controller,
  String btnText, {
  required bool isLastPage,
}) {
  return ConstrainedBox(
    // Caps the button at 280 on normal screens (unchanged from before) but
    // lets it shrink instead of overflowing on very narrow viewports.
    constraints: const BoxConstraints(maxWidth: 280),
    child: SizedBox(
      width: double.infinity,
      height: 52,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.secondaryColor, AppColors.success],
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.secondaryColor.withValues(alpha: 0.4),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Material(
          color: AppColors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(100),
            onTap: () {
              if (isLastPage) {
                Get.offNamed("/login");
              } else {
                controller.pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  btnText,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
                const SizedBox(width: 8),
                Icon(
                  isLastPage
                      ? Icons.check_circle_rounded
                      : Icons.arrow_forward_rounded,
                  size: 20,
                  color: AppColors.primaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

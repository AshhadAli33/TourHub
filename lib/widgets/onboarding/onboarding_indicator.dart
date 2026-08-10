import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourhub/utils/app_colors.dart';
import 'package:tourhub/controllers/onboarding/onboarding_controller.dart';
import 'package:tourhub/models/onboarding_items.dart';

Widget buildPageIndicator(OnboardingController controller) {
  return Obx(
    () => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(onboardingItems.length, (i) {
        final isActive = controller.pageIndex.value == i;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 6),
          width: isActive ? 26 : 10,
          height: 10,
          decoration: BoxDecoration(
            color: isActive
                ? AppColors.secondaryColor
                : AppColors.secondaryColor.withAlpha((0.4 * 255).toInt()),
            borderRadius: BorderRadius.circular(40),
          ),
        );
      }),
    ),
  );
}

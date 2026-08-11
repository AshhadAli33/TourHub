import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tourhub/controllers/onboarding/onboarding_controller.dart';
import 'package:tourhub/models/onboarding_items.dart';
import 'package:tourhub/utils/app_colors.dart';
import 'package:tourhub/widgets/common/responsive_center.dart';
import 'package:tourhub/widgets/onboarding/onboarding_button.dart';
import 'package:tourhub/widgets/onboarding/onboarding_indicator.dart';

class OnboardingView extends StatelessWidget {
  final controller = Get.find<OnboardingController>();

  OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Lottie.asset(
              "assets/animations/background.json",
              fit: BoxFit.cover,
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: controller.pageController,
                    itemCount: onboardingItems.length,
                    onPageChanged: controller.onPageChanged,
                    itemBuilder: (context, index) {
                      final item = onboardingItems[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: ResponsiveCenter(
                          alignment: Alignment.center,
                          maxWidth: 480,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _IconBadge(icon: item.icon),
                              const SizedBox(height: 32),

                              Text(
                                item.title,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w900,
                                  color: AppColors.headingtextcolor,
                                ),
                              ),

                              const SizedBox(height: 16),

                              Text(
                                item.description,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 17,
                                  height: 1.55,
                                  color: AppColors.textcolor.withValues(
                                    alpha: 0.9,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                buildPageIndicator(controller),

                const SizedBox(height: 24),

                Obx(() {
                  final isLastPage =
                      controller.pageIndex.value == onboardingItems.length - 1;

                  return buildBottomButton(
                    controller,
                    isLastPage ? "Get Started" : "Next",
                    isLastPage: isLastPage,
                  );
                }),

                const SizedBox(height: 26),
              ],
            ),
          ),

          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 8, right: 20),
                child: Obx(() {
                  final isLastPage =
                      controller.pageIndex.value == onboardingItems.length - 1;
                  if (isLastPage) return const SizedBox.shrink();

                  return TextButton(
                    onPressed: () => Get.offNamed("/login"),
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.textcolor,
                      backgroundColor: AppColors.white12,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      "Skip",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _IconBadge extends StatelessWidget {
  final IconData icon;

  const _IconBadge({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.secondaryColor, AppColors.success],
        ),
      ),
      child: Container(
        height: 96,
        width: 96,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.primaryColor,
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) => ScaleTransition(
            scale: animation,
            child: FadeTransition(opacity: animation, child: child),
          ),
          child: Icon(
            icon,
            key: ValueKey(icon),
            size: 44,
            color: AppColors.secondaryColor,
          ),
        ),
      ),
    );
  }
}

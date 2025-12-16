import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tourhub/controllers/onboarding/onboarding_controller.dart';
import 'package:tourhub/models/onboarding_items.dart';
import 'package:tourhub/utils/app_colors.dart';
import 'package:tourhub/widgets/onboarding/onboarding_button.dart';
import 'package:tourhub/widgets/onboarding/onboarding_indicator.dart';

class OnboardingView extends StatelessWidget {
  final controller = Get.put(OnboardingController());
  final PageController pageController = PageController();

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
                    controller: pageController,
                    itemCount: onboardingItems.length,
                    onPageChanged: controller.onPageChanged,
                    itemBuilder: (context, index) {
                      final item = onboardingItems[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
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
                                color: AppColors.textcolor.withOpacity(0.9),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                buildPageIndicator(),

                const SizedBox(height: 24),

                Obx(() {
                  bool isLastPage =
                      controller.pageIndex.value == onboardingItems.length - 1;

                  return buildBottomButton(
                    pageController,
                    isLastPage ? "Get Started" : "Next",
                  );
                }),

                const SizedBox(height: 26),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/bottom_navigation_bar/bottom_nav_controller.dart';
import '../../utils/app_colors.dart';

class CustomBottomNavBar extends GetView<BottomNavController> {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.paddingOf(context).bottom;

    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 20 + bottomInset),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
          child: Container(
            height: 78,
            decoration: BoxDecoration(
              color: AppColors.white.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(28),
              border: Border.all(
                color: AppColors.white.withValues(alpha: 0.25),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _navItem(
                  Icons.home_rounded,
                  Icons.home_outlined,
                  "Home",
                  0,
                ),
                _navItem(
                  Icons.airplane_ticket_rounded,
                  Icons.airplane_ticket_outlined,
                  "Booking",
                  1,
                ),
                _navItem(
                  Icons.chat_bubble_rounded,
                  Icons.chat_bubble_outline_rounded,
                  "Chat",
                  2,
                ),
                _navItem(
                  Icons.person_rounded,
                  Icons.person_outline_rounded,
                  "Profile",
                  3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _navItem(
    IconData selectedIcon,
    IconData unselectedIcon,
    String label,
    int index,
  ) {
    return Obx(() {
      final bool isSelected = controller.currentIndex.value == index;
      final icon = isSelected ? selectedIcon : unselectedIcon;

      return GestureDetector(
        onTap: () => controller.changeIndex(index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.white.withValues(alpha: 0.25)
                : AppColors.transparent,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedScale(
                scale: isSelected ? 1.1 : 1.0,
                duration: const Duration(milliseconds: 250),
                child: Icon(icon, size: 26, color: AppColors.primaryColor),
              ),
              const SizedBox(height: 4),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 250),
                opacity: isSelected ? 1 : 0.7,
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.primaryColor,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

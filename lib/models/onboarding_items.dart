import 'package:flutter/material.dart';

class OnboardingItem {
  final String title;
  final String description;
  final String buttonText;
  final IconData icon;

  OnboardingItem({
    required this.title,
    required this.description,
    required this.buttonText,
    required this.icon,
  });
}

final onboardingItems = [
  OnboardingItem(
    title: "Life is short and the world is wide",
    description:
        "At Friends tours and travel, we customize reliable and trustworthy educational tours to destinations all over the world",
    buttonText: "Get Started",
    icon: Icons.travel_explore_rounded,
  ),
  OnboardingItem(
    title: "It’s a big world out there go explore",
    description:
        "To get the best of your adventure you just need to leave at home and go where you like; we are waiting for you",
    buttonText: "Next",
    icon: Icons.public_rounded,
  ),
  OnboardingItem(
    title: "People don’t take trips, trips take people",
    description:
        "To get the best of your adventure you just need to leave at home and go where you like; we are waiting for you",
    buttonText: "Next",
    icon: Icons.diversity_3_rounded,
  ),
];

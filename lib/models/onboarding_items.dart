class OnboardingItem {
  final String title;
  final String description;
  final String buttonText;

  OnboardingItem({
    required this.title,
    required this.description,
    required this.buttonText,
  });
}

final onboardingItems = [
  OnboardingItem(
    title: "Life is short and the world is wide",
    description:
        "At Friends tours and travel, we customize reliable and trustworthy educational tours to destinations all over the world",
    buttonText: "Get Started",
  ),
  OnboardingItem(
    title: "It’s a big world out there go explore",
    description:
        "To get the best of your adventure you just need to leave at home and go where you like; we are waiting for you",
    buttonText: "Next",
  ),
  OnboardingItem(
    title: "People don’t take trips, trips take people",
    description:
        "To get the best of your adventure you just need to leave at home and go where you like; we are waiting for you",
    buttonText: "Next",
  ),
];

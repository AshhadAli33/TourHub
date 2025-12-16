import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF102040);
  static const Color secondaryColor = Color.fromARGB(255, 180, 149, 46);
  static const Color headingtextcolor = Color.fromARGB(255, 131, 131, 131);
  static const Color textcolor = Color(0xFFFFFFFF);

  static const LinearGradient onboardingGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF0A0F24),
      Color(0xFF102040),
      Color(0xFF1A2F63),
      Color(0xFF1A2F63),
    ],
  );
}

import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF102040);
  static const Color secondaryColor = Color.fromARGB(255, 180, 149, 46);
  static const Color headingtextcolor = Color.fromARGB(255, 131, 131, 131);
  static const Color textcolor = Color(0xFFFFFFFF);

  // White and its translucent variants — mirrors Colors.white / whiteNN so
  // every screen pulls from one source instead of the raw Colors class.
  static const Color white = Color(0xFFFFFFFF);
  static const Color white70 = Color(0xB3FFFFFF);
  static const Color white60 = Color(0x99FFFFFF);
  static const Color white54 = Color(0x8AFFFFFF);
  static const Color white24 = Color(0x3DFFFFFF);
  static const Color white12 = Color(0x1FFFFFFF);

  static const Color transparent = Color(0x00000000);

  // Status colors used for danger actions and snackbars.
  static const Color danger = Color(0xFFFF5252);
  static const Color error = Color(0xFFF44336);
  static const Color success = Color(0xFF4CAF50);
  static const Color overlayGrey = Color(0xFF9E9E9E);

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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/theme_service.dart';

class AppColors {
  static bool get _isDark => Get.find<ThemeService>().isDarkMode;

  static const Color primaryColor = Color(0xFF102040);
  static const Color secondaryColor = Color.fromARGB(255, 180, 149, 46);
  static const Color headingtextcolor = Color.fromARGB(255, 131, 131, 131);

  // Fixed white for text/icons placed on a surface that is always navy
  // (primaryColor), regardless of theme — e.g. AppBars, snackbars.
  static const Color onPrimary = Color(0xFFFFFFFF);

  // Text/icon/border colors — foreground-on-background roles that flip
  // between white-on-navy (dark mode) and navy-on-white (light mode).
  static Color get textcolor => _isDark ? const Color(0xFFFFFFFF) : const Color(0xFF102040);
  static Color get white => _isDark ? const Color(0xFFFFFFFF) : const Color(0xFF102040);
  static Color get white70 => _isDark ? const Color(0xB3FFFFFF) : const Color(0xB3102040);
  static Color get white60 => _isDark ? const Color(0x99FFFFFF) : const Color(0x99102040);
  static Color get white54 => _isDark ? const Color(0x8AFFFFFF) : const Color(0x8A102040);
  static Color get white24 => _isDark ? const Color(0x3DFFFFFF) : const Color(0x3D102040);
  static Color get white12 => _isDark ? const Color(0x1FFFFFFF) : const Color(0x1F102040);

  static const Color transparent = Color(0x00000000);

  // Status colors used for danger actions and snackbars.
  static const Color danger = Color(0xFFFF5252);
  static const Color error = Color(0xFFF44336);
  static const Color success = Color(0xFF4CAF50);
  static const Color overlayGrey = Color(0xFF9E9E9E);

  static LinearGradient get onboardingGradient => _isDark
      ? const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF0A0F24),
            Color(0xFF102040),
            Color(0xFF1A2F63),
            Color(0xFF1A2F63),
          ],
        )
      : const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFFFFBF3),
            Color(0xFFF3EFFA),
            Color(0xFFDEE6F9),
            Color(0xFFDEE6F9),
          ],
        );
}

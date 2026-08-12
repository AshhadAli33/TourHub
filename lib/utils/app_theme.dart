import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF0A0F24),
    canvasColor: const Color(0xFF0A0F24),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.secondaryColor,
      brightness: Brightness.dark,
      primary: AppColors.secondaryColor,
      surface: const Color(0xFF102040),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? AppColors.secondaryColor
            : Colors.white70,
      ),
      trackColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? AppColors.secondaryColor.withValues(alpha: 0.4)
            : Colors.white.withValues(alpha: 0.16),
      ),
      trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),
    ),
  );

  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFFFFBF3),
    canvasColor: const Color(0xFFFFFBF3),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.secondaryColor,
      brightness: Brightness.light,
      primary: AppColors.secondaryColor,
      surface: const Color(0xFFEEF2FB),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? AppColors.secondaryColor
            : AppColors.primaryColor,
      ),
      trackColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? AppColors.secondaryColor.withValues(alpha: 0.35)
            : AppColors.primaryColor.withValues(alpha: 0.14),
      ),
      trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),
    ),
  );
}

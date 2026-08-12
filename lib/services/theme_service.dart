import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService {
  final _box = GetStorage();
  static const _key = 'isDarkMode';

  ThemeMode get themeMode => isDarkMode ? ThemeMode.dark : ThemeMode.light;

  bool get isDarkMode => _box.read(_key) ?? true;

  void toggleTheme() {
    final next = !isDarkMode;
    _box.write(_key, next);
    Get.changeThemeMode(next ? ThemeMode.dark : ThemeMode.light);
    // AppColors reads are plain getters, not tied to an InheritedWidget, so
    // changeThemeMode alone won't repaint them — force a full rebuild.
    Get.forceAppUpdate();
  }
}

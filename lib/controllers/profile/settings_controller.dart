import 'package:get/get.dart';
import '../../services/theme_service.dart';

class SettingsController extends GetxController {
  final _themeService = Get.find<ThemeService>();

  late final isDarkMode = _themeService.isDarkMode.obs;
  var isNotificationOn = true.obs;

  void toggleTheme() {
    _themeService.toggleTheme();
    isDarkMode.value = _themeService.isDarkMode;
  }

  void toggleNotification() => isNotificationOn.value = !isNotificationOn.value;
}

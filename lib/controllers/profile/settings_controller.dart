import 'package:get/get.dart';

class SettingsController extends GetxController {
  var isDarkMode = false.obs;
  var isNotificationOn = true.obs;

  void toggleTheme() => isDarkMode.value = !isDarkMode.value;
  void toggleNotification() => isNotificationOn.value = !isNotificationOn.value;
}

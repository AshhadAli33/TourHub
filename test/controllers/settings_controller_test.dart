import 'package:flutter_test/flutter_test.dart';
import 'package:tourhub/controllers/profile/settings_controller.dart';

void main() {
  group('SettingsController', () {
    test('toggleTheme flips isDarkMode', () {
      final controller = SettingsController();
      expect(controller.isDarkMode.value, false);

      controller.toggleTheme();
      expect(controller.isDarkMode.value, true);

      controller.toggleTheme();
      expect(controller.isDarkMode.value, false);
    });

    test('toggleNotification flips isNotificationOn', () {
      final controller = SettingsController();
      expect(controller.isNotificationOn.value, true);

      controller.toggleNotification();
      expect(controller.isNotificationOn.value, false);
    });
  });
}

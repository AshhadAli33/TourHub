import 'package:flutter_test/flutter_test.dart';
import 'package:tourhub/controllers/bottom_navigation_bar/bottom_nav_controller.dart';

void main() {
  group('BottomNavController', () {
    test('starts on the first tab', () {
      final controller = BottomNavController();
      expect(controller.currentIndex.value, 0);
    });

    test('changeIndex updates the selected tab', () {
      final controller = BottomNavController();
      controller.changeIndex(3);
      expect(controller.currentIndex.value, 3);
    });
  });
}

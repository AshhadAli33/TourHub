import 'package:flutter_test/flutter_test.dart';
import 'package:tourhub/controllers/onboarding/onboarding_controller.dart';

void main() {
  group('OnboardingController', () {
    late OnboardingController controller;

    setUp(() {
      controller = OnboardingController();
    });

    test('starts at page 0', () {
      expect(controller.pageIndex.value, 0);
    });

    test('nextPage advances the index up to the last page', () {
      controller.nextPage();
      expect(controller.pageIndex.value, 1);

      controller.nextPage();
      expect(controller.pageIndex.value, 2);

      controller.nextPage();
      expect(controller.pageIndex.value, 2, reason: 'should not go past the last page');
    });

    test('onPageChanged sets the index directly', () {
      controller.onPageChanged(1);
      expect(controller.pageIndex.value, 1);
    });
  });
}

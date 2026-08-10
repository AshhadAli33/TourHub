import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:tourhub/controllers/login/login_controller.dart';
import 'package:tourhub/services/auth_service.dart';

void main() {
  setUp(() {
    Get.testMode = true;
    Get.put(AuthService());
  });

  tearDown(() {
    Get.reset();
  });

  testWidgets('login shows a validation error when fields are empty', (
    tester,
  ) async {
    await tester.pumpWidget(GetMaterialApp(home: Container()));

    final controller = LoginController();
    await controller.login();
    await tester.pump();

    expect(controller.isLoading.value, false);
    expect(find.text('Email & Password cannot be empty'), findsOneWidget);

    // Drain the snackbar's show/dismiss timers in one jump so no timers
    // are left pending when the test tears down.
    await tester.pump(const Duration(seconds: 5));
  });

  test('togglePassword flips isPasswordVisible', () {
    final controller = LoginController();
    expect(controller.isPasswordVisible.value, false);

    controller.togglePassword();
    expect(controller.isPasswordVisible.value, true);
  });
}

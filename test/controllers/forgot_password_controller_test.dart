import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:tourhub/controllers/forgot_password/forgot_password_controller.dart';
import 'package:tourhub/services/auth_service.dart';

void main() {
  setUp(() {
    Get.testMode = true;
    Get.put(AuthService());
  });

  tearDown(() {
    Get.reset();
  });

  testWidgets('resetPassword shows a validation error when email is empty', (
    tester,
  ) async {
    await tester.pumpWidget(GetMaterialApp(home: Container()));

    final controller = ForgotPasswordController();
    await controller.resetPassword();
    await tester.pump();

    expect(controller.isLoading.value, false);
    expect(find.text('Email is required'), findsOneWidget);

    await tester.pump(const Duration(seconds: 5));
  });

  testWidgets('resetPassword rejects an invalid email address', (
    tester,
  ) async {
    await tester.pumpWidget(GetMaterialApp(home: Container()));

    final controller = ForgotPasswordController();
    controller.emailController.text = 'not-an-email';

    await controller.resetPassword();
    await tester.pump();

    expect(find.text('Please enter a valid email address'), findsOneWidget);

    await tester.pump(const Duration(seconds: 5));
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:tourhub/controllers/signup/signup_controller.dart';
import 'package:tourhub/services/auth_service.dart';

void main() {
  setUp(() {
    Get.testMode = true;
    Get.put(AuthService());
  });

  tearDown(() {
    Get.reset();
  });

  testWidgets('signup shows a validation error when fields are empty', (
    tester,
  ) async {
    await tester.pumpWidget(GetMaterialApp(home: Container()));

    final controller = SignupController();
    await controller.signup();
    await tester.pump();

    expect(controller.isLoading.value, false);
    expect(find.text('All fields are required'), findsOneWidget);

    await tester.pump(const Duration(seconds: 5));
  });

  testWidgets('signup rejects an invalid email address', (tester) async {
    await tester.pumpWidget(GetMaterialApp(home: Container()));

    final controller = SignupController();
    controller.nameController.text = 'Jane Doe';
    controller.emailController.text = 'not-an-email';
    controller.passwordController.text = 'password123';

    await controller.signup();
    await tester.pump();

    expect(find.text('Please enter a valid email address'), findsOneWidget);

    await tester.pump(const Duration(seconds: 5));
  });

  testWidgets('signup rejects a password shorter than 6 characters', (
    tester,
  ) async {
    await tester.pumpWidget(GetMaterialApp(home: Container()));

    final controller = SignupController();
    controller.nameController.text = 'Jane Doe';
    controller.emailController.text = 'jane@example.com';
    controller.passwordController.text = '123';

    await controller.signup();
    await tester.pump();

    expect(
      find.text('Password must be at least 6 characters long'),
      findsOneWidget,
    );

    await tester.pump(const Duration(seconds: 5));
  });
}

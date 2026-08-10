import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/splash/splash_controller.dart';
import '../../widgets/common/gradient_scaffold.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final SplashController controller = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: Center(child: Image.asset("assets/images/logo.png", width: 160)),
    );
  }
}

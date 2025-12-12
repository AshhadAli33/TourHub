import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tourhub/routes/app_routes.dart';
import 'package:tourhub/utils/app_colors.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  void _navigate() async {
    await Future.delayed(Duration(seconds: 2));

    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // user is logged in
      Get.offAllNamed(AppRoutes.home);
    } else {
      // user NOT logged in → go to onboarding
      Get.offAllNamed(AppRoutes.onboard);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.onboardingGradient),
        child: Center(child: Image.asset("assets/images/logo.png", width: 160)),
      ),
    );
  }
}

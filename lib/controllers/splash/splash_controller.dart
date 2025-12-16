import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    _navigateAfterSplash();
  }

  void _navigateAfterSplash() async {
    await Future.delayed(const Duration(seconds: 2));

    FirebaseAuth.instance
        .authStateChanges()
        .first
        .then((user) {
          if (user != null) {
            Get.offAllNamed(AppRoutes.home);
          } else {
            Get.offAllNamed(AppRoutes.onboard);
          }
        })
        .catchError((error) {
          Get.offAllNamed(AppRoutes.onboard);
        });
  }
}

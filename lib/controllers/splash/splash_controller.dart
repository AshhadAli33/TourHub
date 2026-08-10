import 'package:get/get.dart';
import '../../routes/app_routes.dart';
import '../../services/auth_service.dart';

class SplashController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();

  @override
  void onReady() {
    super.onReady();
    _navigateAfterSplash();
  }

  void _navigateAfterSplash() async {
    await Future.delayed(const Duration(seconds: 2));

    _authService.authStateChanges.first
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

import 'package:get/get.dart';
import 'package:tourhub/views/login_view.dart';
import 'package:tourhub/views/onboarding_view.dart';
import 'package:tourhub/views/signup_view.dart';
import 'package:tourhub/views/forgot_password_view.dart';
import 'package:tourhub/views/splash_view.dart';
import 'package:tourhub/views/home_view.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.splash, page: () => SplashScreen()),
    GetPage(name: AppRoutes.onboard, page: () => OnboardingView()),
    GetPage(name: AppRoutes.login, page: () => LoginView()),
    GetPage(name: AppRoutes.signup, page: () => SignupView()),
    GetPage(name: AppRoutes.forgot, page: () => ForgotPasswordView()),
    GetPage(name: AppRoutes.home, page: () => HomeView()),
  ];
}

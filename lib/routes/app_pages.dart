import 'package:get/get.dart';
import 'package:tourhub/views/profile/edit_profile_view.dart';
import 'package:tourhub/views/profile/profile_view.dart';
import 'package:tourhub/views/profile/settings_view.dart';

import '../views/splash/splash_view.dart';
import '../views/onboarding/onboarding_view.dart';
import '../views/login/login_view.dart';
import '../views/signup/signup_view.dart';
import '../views/forgot_password/forgot_password_view.dart';
import '../views/home/home_view.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.splash, page: () => SplashScreen()),

    GetPage(name: AppRoutes.onboard, page: () => OnboardingView()),

    GetPage(name: AppRoutes.login, page: () => LoginView()),

    GetPage(name: AppRoutes.signup, page: () => SignupView()),

    GetPage(name: AppRoutes.forgot, page: () => ForgotPasswordView()),

    GetPage(name: AppRoutes.home, page: () => HomeView()),

    GetPage(name: AppRoutes.profile, page: () => ProfileView()),

    GetPage(name: AppRoutes.editProfile, page: () => EditProfileView()),

    GetPage(name: AppRoutes.settings, page: () => SettingsView()),
  ];
}

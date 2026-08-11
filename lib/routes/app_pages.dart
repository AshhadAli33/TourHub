import 'package:get/get.dart';
import 'package:tourhub/views/profile/edit_profile_view.dart';
import 'package:tourhub/views/profile/profile_view.dart';
import 'package:tourhub/views/profile/settings_view.dart';

import '../bindings/edit_profile_binding.dart';
import '../bindings/forgot_password_binding.dart';
import '../bindings/home_binding.dart';
import '../bindings/login_binding.dart';
import '../bindings/onboarding_binding.dart';
import '../bindings/settings_binding.dart';
import '../bindings/signup_binding.dart';
import '../bindings/splash_binding.dart';
import '../views/splash/splash_view.dart';
import '../views/onboarding/onboarding_view.dart';
import '../views/login/login_view.dart';
import '../views/signup/signup_view.dart';
import '../views/forgot_password/forgot_password_view.dart';
import '../views/home/home_view.dart';
import '../models/tour_post.dart';
import '../models/chat_conversation.dart';
import '../views/tour_details/tour_details_view.dart';
import '../views/booking/tour_booking_view.dart';
import '../views/chats/chat_detail_view.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),

    GetPage(
      name: AppRoutes.onboard,
      page: () => OnboardingView(),
      binding: OnboardingBinding(),
    ),

    GetPage(
      name: AppRoutes.login,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),

    GetPage(
      name: AppRoutes.signup,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),

    GetPage(
      name: AppRoutes.forgot,
      page: () => ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),

    GetPage(
      name: AppRoutes.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),

    GetPage(name: AppRoutes.profile, page: () => ProfileView()),

    GetPage(
      name: AppRoutes.editProfile,
      page: () => EditProfileView(),
      binding: EditProfileBinding(),
    ),

    GetPage(
      name: AppRoutes.settings,
      page: () => SettingsView(),
      binding: SettingsBinding(),
    ),

    GetPage(
      name: AppRoutes.tourDetails,
      page: () => TourDetailsView(post: Get.arguments as TourPost),
    ),

    GetPage(
      name: AppRoutes.tourBooking,
      page: () => TourBookingView(post: Get.arguments as TourPost),
    ),

    GetPage(
      name: AppRoutes.chatDetail,
      page: () =>
          ChatDetailView(conversation: Get.arguments as ChatConversation),
    ),
  ];
}

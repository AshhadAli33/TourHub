import 'package:flutter_test/flutter_test.dart';
import 'package:tourhub/routes/app_pages.dart';
import 'package:tourhub/routes/app_routes.dart';

void main() {
  test('every named route resolves to a registered page', () {
    final registeredNames = AppPages.pages.map((page) => page.name).toSet();

    for (final route in [
      AppRoutes.splash,
      AppRoutes.onboard,
      AppRoutes.login,
      AppRoutes.signup,
      AppRoutes.forgot,
      AppRoutes.home,
      AppRoutes.profile,
      AppRoutes.editProfile,
      AppRoutes.settings,
      AppRoutes.tourDetails,
      AppRoutes.tourBooking,
    ]) {
      expect(
        registeredNames.contains(route),
        true,
        reason: '$route is missing from AppPages.pages',
      );
    }
  });
}

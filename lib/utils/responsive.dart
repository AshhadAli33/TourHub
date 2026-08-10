import 'package:flutter/material.dart';

class ResponsiveBreakpoints {
  ResponsiveBreakpoints._();

  static const double tablet = 600;
  static const double desktop = 1024;
}

enum ScreenSize { mobile, tablet, desktop }

extension ResponsiveContext on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width;

  bool get isMobile => screenWidth < ResponsiveBreakpoints.tablet;

  bool get isTablet =>
      screenWidth >= ResponsiveBreakpoints.tablet &&
      screenWidth < ResponsiveBreakpoints.desktop;

  bool get isDesktop => screenWidth >= ResponsiveBreakpoints.desktop;

  ScreenSize get screenSize {
    if (isDesktop) return ScreenSize.desktop;
    if (isTablet) return ScreenSize.tablet;
    return ScreenSize.mobile;
  }
}

/// Picks a value based on the current screen size. [tablet] falls back to
/// [mobile] and [desktop] falls back to [tablet] then [mobile] when not
/// provided, so callers only need to specify the sizes that actually differ.
///
/// Example:
/// ```dart
/// final columns = responsiveValue(context, mobile: 1, tablet: 2, desktop: 3);
/// ```
T responsiveValue<T>(
  BuildContext context, {
  required T mobile,
  T? tablet,
  T? desktop,
}) {
  switch (context.screenSize) {
    case ScreenSize.desktop:
      return desktop ?? tablet ?? mobile;
    case ScreenSize.tablet:
      return tablet ?? mobile;
    case ScreenSize.mobile:
      return mobile;
  }
}

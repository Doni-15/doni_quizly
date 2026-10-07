import 'package:flutter/material.dart';

enum QuizDeviceType { mobile, tablet, desktop }

abstract final class QuizResponsive {
  static const double tabletBreakpoint = 600;
  static const double desktopBreakpoint = 900;
  static const double maxContentWidth = 720;
  static const double maxButtonWidth = 360;
  static const double _referenceWidth = 390;

  static QuizDeviceType deviceType(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width < tabletBreakpoint) return QuizDeviceType.mobile;
    if (width < desktopBreakpoint) return QuizDeviceType.tablet;
    return QuizDeviceType.desktop;
  }

  static bool isMobile(BuildContext context) => deviceType(context) == QuizDeviceType.mobile;
  static bool isTablet(BuildContext context) => deviceType(context) == QuizDeviceType.tablet;
  static bool isDesktop(BuildContext context) => deviceType(context) == QuizDeviceType.desktop;

  static T pick<T>(
    BuildContext context, {
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    return switch (deviceType(context)) { 
      QuizDeviceType.mobile 
        => mobile, QuizDeviceType.tablet 
        => tablet ?? mobile, QuizDeviceType.desktop 
        => desktop ?? tablet ?? mobile,
    };
  }

  static double horizontalPadding(BuildContext context) => (
    MediaQuery.sizeOf(context).width * 0.05
  ).clamp(16.0, 48.0).toDouble();

  static double textFactor(Size size) => (
    size.shortestSide / _referenceWidth
  ).clamp(0.9, 1.3).toDouble();

  static Widget appBuilder(BuildContext context, Widget? child) {
    final media = MediaQuery.of(context);
    final system = (media.textScaler.scale(14) / 14).clamp(0.9, 1.3).toDouble();

    return MediaQuery( data: media.copyWith(   
      textScaler: TextScaler.linear(system * textFactor(media.size)), 
    ),
    child: child ?? const SizedBox.shrink(),
    );
  }
}

extension QuizSizeContext on BuildContext {
  Size get screenSize => MediaQuery.sizeOf(this);
  double wp(double fraction) => screenSize.width * fraction;
  double hp(double fraction) => screenSize.height * fraction;
  double sp(double fraction) => screenSize.shortestSide * fraction;
  bool get isLandscape => MediaQuery.orientationOf(this) == Orientation.landscape;
}

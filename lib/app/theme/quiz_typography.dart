import 'package:flutter/material.dart';

abstract final class QuizTypography {
  static const fontFamily = 'PlusJakartaSans';

  static const textTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 48,
      height: 1.15,
      fontWeight: FontWeight.w800,
    ),
    displayMedium: TextStyle(
      fontSize: 40,
      height: 1.20,
      fontWeight: FontWeight.w800,
    ),
    displaySmall: TextStyle(
      fontSize: 36,
      height: 1.20,
      fontWeight: FontWeight.w800,
    ),

    headlineLarge: TextStyle(
      fontSize: 32,
      height: 1.25,
      fontWeight: FontWeight.w800,
    ),
    headlineMedium: TextStyle(
      fontSize: 28,
      height: 1.25,
      fontWeight: FontWeight.w700,
    ),
    headlineSmall: TextStyle(
      fontSize: 24,
      height: 1.30,
      fontWeight: FontWeight.w700,
    ),

    titleLarge: TextStyle(
      fontSize: 20,
      height: 1.35,
      fontWeight: FontWeight.w700,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      height: 1.40,
      fontWeight: FontWeight.w700,
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      height: 1.40,
      fontWeight: FontWeight.w700,
    ),

    bodyLarge: TextStyle(
      fontSize: 16,
      height: 1.55,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      height: 1.50,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      height: 1.50,
      fontWeight: FontWeight.w400,
    ),

    labelLarge: TextStyle(
      fontSize: 14,
      height: 1.40,
      fontWeight: FontWeight.w700,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      height: 1.40,
      fontWeight: FontWeight.w700,
    ),
    labelSmall: TextStyle(
      fontSize: 11,
      height: 1.40,
      fontWeight: FontWeight.w700,
    ),
  );
}

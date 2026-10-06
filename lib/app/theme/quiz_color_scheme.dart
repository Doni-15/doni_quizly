import 'package:flutter/material.dart';

import 'quiz_colors.dart';

abstract final class QuizColorScheme {
  static final light = _build(QuizColors.light, QuizColors.dark, Brightness.light);
  static final dark = _build(QuizColors.dark, QuizColors.light, Brightness.dark);

  static ColorScheme _build(
    QuizColors c,
    QuizColors opposite,
    Brightness brightness,
  ) {
    return ColorScheme.fromSeed(
      seedColor: c.primary,
      brightness: brightness,
    ).copyWith(
      primary: c.primary,
      onPrimary: c.onPrimary,
      primaryContainer: c.primaryContainer,
      onPrimaryContainer: c.onPrimaryContainer,

      secondary: c.secondary,
      onSecondary: c.onSecondary,
      secondaryContainer: c.secondaryContainer,
      onSecondaryContainer: c.onSecondaryContainer,

      tertiary: c.gold,
      onTertiary: c.onGold,
      tertiaryContainer: c.goldContainer,
      onTertiaryContainer: c.onGoldContainer,

      surface: c.surface,
      surfaceDim: c.background,
      surfaceBright: c.surfaceRaised,
      surfaceContainerLowest: c.background,
      surfaceContainerLow: c.surface,
      surfaceContainer: c.surface,
      surfaceContainerHigh: c.surfaceRaised,
      surfaceContainerHighest: c.surfaceRaised,

      onSurface: c.textPrimary,
      onSurfaceVariant: c.textSecondary,
      outline: c.border,
      outlineVariant: c.divider,

      error: c.error,
      onError: c.onError,
      errorContainer: c.errorContainer,
      onErrorContainer: c.onErrorContainer,

      inverseSurface: c.textPrimary,
      onInverseSurface: c.background,
      inversePrimary: opposite.primary,
      surfaceTint: c.primary,
      shadow: Colors.black,
      scrim: Colors.black,
    );
  }
}

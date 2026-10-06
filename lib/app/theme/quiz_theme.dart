import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'quiz_color_scheme.dart';
import 'quiz_colors.dart';
import 'quiz_typography.dart';

abstract final class QuizTheme {
  static final light = _build(QuizColorScheme.light, QuizColors.light);
  static final dark = _build(QuizColorScheme.dark, QuizColors.dark);
  static const double radius = 16;

  static ThemeData _build(ColorScheme scheme, QuizColors c) {
    final isLight = scheme.brightness == Brightness.light;
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(radius),
    );
    final textTheme = QuizTypography.textTheme.apply(
      fontFamily: QuizTypography.fontFamily,
      bodyColor: c.textPrimary,
      displayColor: c.textPrimary,
    );

    OutlineInputBorder inputBorder(Color color, [double width = 1.5]) =>
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(color: color, width: width),
        );

    return ThemeData(
      useMaterial3: true,
      brightness: scheme.brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor: c.background,
      fontFamily: QuizTypography.fontFamily,
      textTheme: textTheme,
      extensions: [c],

      appBarTheme: AppBarTheme(
        backgroundColor: c.background,
        foregroundColor: c.textPrimary,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: textTheme.titleLarge,
        systemOverlayStyle: isLight
            ? SystemUiOverlayStyle.dark
            : SystemUiOverlayStyle.light,
      ),

      cardTheme: CardThemeData(
        color: c.surface,
        surfaceTintColor: Colors.transparent,
        shadowColor: c.shadow,
        elevation: isLight ? 2 : 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius + 4),
          side: BorderSide(color: c.divider),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: c.surface,
        hintStyle: textTheme.bodyLarge?.copyWith(color: c.textMuted),
        labelStyle: textTheme.bodyMedium?.copyWith(color: c.textSecondary),
        floatingLabelStyle: textTheme.labelLarge?.copyWith(color: c.primary),
        errorStyle: textTheme.bodySmall?.copyWith(color: c.error),
        prefixIconColor: c.textSecondary,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: inputBorder(c.border),
        enabledBorder: inputBorder(c.border),
        focusedBorder: inputBorder(c.primary, 2),
        errorBorder: inputBorder(c.error),
        focusedErrorBorder: inputBorder(c.error, 2),
      ),

      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: c.primary,
          foregroundColor: c.onPrimary,
          disabledBackgroundColor: c.divider,
          disabledForegroundColor: c.textMuted,
          minimumSize: const Size(kMinInteractiveDimension, kMinInteractiveDimension),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          textStyle: textTheme.labelLarge,
          shape: shape,
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: c.primary,
          side: BorderSide(color: c.border, width: 1.5),
          minimumSize: const Size(kMinInteractiveDimension, kMinInteractiveDimension),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          textStyle: textTheme.labelLarge,
          shape: shape,
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: c.primary,
          minimumSize: const Size(kMinInteractiveDimension, kMinInteractiveDimension),
          textStyle: textTheme.labelLarge,
          shape: shape,
        ),
      ),

      iconTheme: IconThemeData(color: c.textPrimary),

      dividerTheme: DividerThemeData(color: c.divider, thickness: 1, space: 1),

      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: c.primary,
        linearTrackColor: c.primaryContainer,
        circularTrackColor: c.primaryContainer,
        linearMinHeight: 8,
      ),

      dialogTheme: DialogThemeData(
        backgroundColor: c.surface,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: textTheme.titleLarge,
        contentTextStyle: textTheme.bodyMedium?.copyWith(color: c.textSecondary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius + 8),
        ),
      ),

      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: c.textPrimary,
        contentTextStyle: textTheme.bodyMedium?.copyWith(color: c.background),
        actionTextColor: c.primaryContainer,
        shape: shape,
      ),

      // Tombol ganti tema terang/gelap.
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith(
          (s) => s.contains(WidgetState.selected) ? c.onPrimary : c.textSecondary,
        ),
        trackColor: WidgetStateProperty.resolveWith(
          (s) => s.contains(WidgetState.selected) ? c.primary : c.surfaceRaised,
        ),
        trackOutlineColor: WidgetStateProperty.resolveWith(
          (s) => s.contains(WidgetState.selected) ? c.primary : c.border,
        ),
      ),
    );
  }
}

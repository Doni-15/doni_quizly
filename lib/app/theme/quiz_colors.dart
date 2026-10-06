import 'package:flutter/material.dart';

enum QuizOptionState { idle, selected, correct, wrong, disabled }

class QuizOptionColors {
  const QuizOptionColors({
    required this.background,
    required this.border,
    required this.foreground,
    required this.badgeBackground,
    required this.badgeForeground,
  });

  final Color background;
  final Color border;
  final Color foreground;

  final Color badgeBackground;
  final Color badgeForeground;
}

@immutable
class QuizColors extends ThemeExtension<QuizColors> {
  const QuizColors({
    required this.background,
    required this.surface,
    required this.surfaceRaised,
    required this.border,
    required this.divider,
    required this.primary,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.textPrimary,
    required this.textSecondary,
    required this.textMuted,
    required this.success,
    required this.onSuccess,
    required this.successContainer,
    required this.onSuccessContainer,
    required this.warning,
    required this.warningContainer,
    required this.onWarningContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.info,
    required this.infoContainer,
    required this.gold,
    required this.onGold,
    required this.goldContainer,
    required this.onGoldContainer,
    required this.shadow,
    required this.imageScrim,
    required this.onImageScrim,
  });

  final Color background;
  final Color surface;
  final Color surfaceRaised;
  final Color border;
  final Color divider;
  final Color primary;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color textPrimary;
  final Color textSecondary;
  final Color textMuted;
  final Color success;
  final Color onSuccess;
  final Color successContainer;
  final Color onSuccessContainer;
  final Color warning;
  final Color warningContainer;
  final Color onWarningContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color info;
  final Color infoContainer;
  final Color gold;
  final Color onGold;
  final Color goldContainer;
  final Color onGoldContainer;
  final Color shadow;
  final Color imageScrim;
  final Color onImageScrim;

  static const light = QuizColors(
    background: Color(0xFFF4F8FC),
    surface: Color(0xFFFFFFFF),
    surfaceRaised: Color(0xFFEAF1F9),
    border: Color(0xFF7C8DA5),
    divider: Color(0xFFDCE5F0),
    primary: Color(0xFF0369A1),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFD7EEFC),
    onPrimaryContainer: Color(0xFF0C4A6E),
    secondary: Color(0xFF4F46E5),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFE0E7FF),
    onSecondaryContainer: Color(0xFF312E81),
    textPrimary: Color(0xFF0F172A),
    textSecondary: Color(0xFF334155),
    textMuted: Color(0xFF5B6B80),
    success: Color(0xFF15803D),
    onSuccess: Color(0xFFFFFFFF),
    successContainer: Color(0xFFDCFCE7),
    onSuccessContainer: Color(0xFF14532D),
    warning: Color(0xFFC2410C),
    warningContainer: Color(0xFFFFEDD5),
    onWarningContainer: Color(0xFF7C2D12),
    error: Color(0xFFBE123C),
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFFFE4E8),
    onErrorContainer: Color(0xFF881337),
    info: Color(0xFF0369A1),
    infoContainer: Color(0xFFE0F2FE),
    gold: Color(0xFFA16207),
    onGold: Color(0xFFFFFFFF),
    goldContainer: Color(0xFFFEF9C3),
    onGoldContainer: Color(0xFF713F12),
    shadow: Color(0x1A0F172A),
    imageScrim: Color(0x990F172A),
    onImageScrim: Color(0xFFFFFFFF),
  );

  static const dark = QuizColors(
    background: Color(0xFF0B1120),
    surface: Color(0xFF131D2E),
    surfaceRaised: Color(0xFF1C2940),
    border: Color(0xFF64748B),
    divider: Color(0xFF2D3B52),
    primary: Color(0xFF38BDF8),
    onPrimary: Color(0xFF082F49),
    primaryContainer: Color(0xFF123B55),
    onPrimaryContainer: Color(0xFFBAE6FD),
    secondary: Color(0xFFA5B4FC),
    onSecondary: Color(0xFF1E1B4B),
    secondaryContainer: Color(0xFF2E315E),
    onSecondaryContainer: Color(0xFFE0E7FF),
    textPrimary: Color(0xFFF1F5F9),
    textSecondary: Color(0xFFB8C5D6),
    textMuted: Color(0xFF94A3B8),
    success: Color(0xFF4ADE80),
    onSuccess: Color(0xFF052E16),
    successContainer: Color(0xFF123524),
    onSuccessContainer: Color(0xFFBBF7D0),
    warning: Color(0xFFFB923C),
    warningContainer: Color(0xFF3F2512),
    onWarningContainer: Color(0xFFFFD7B5),
    error: Color(0xFFFB7185),
    onError: Color(0xFF4C0519),
    errorContainer: Color(0xFF4C1725),
    onErrorContainer: Color(0xFFFFD9DF),
    info: Color(0xFF7DD3FC),
    infoContainer: Color(0xFF12364B),
    gold: Color(0xFFFACC15),
    onGold: Color(0xFF422006),
    goldContainer: Color(0xFF3A3010),
    onGoldContainer: Color(0xFFFEF08A),
    shadow: Color(0x66000000),
    imageScrim: Color(0xE6000000),
    onImageScrim: Color(0xFFFFFFFF),
  );

  QuizOptionColors optionColors(QuizOptionState state) {
    return switch (state) {
      QuizOptionState.idle => QuizOptionColors(
        background: surface,
        border: border,
        foreground: textPrimary,
        badgeBackground: surfaceRaised,
        badgeForeground: textSecondary,
      ),
      QuizOptionState.selected => QuizOptionColors(
        background: primaryContainer,
        border: primary,
        foreground: onPrimaryContainer,
        badgeBackground: primary,
        badgeForeground: onPrimary,
      ),
      QuizOptionState.correct => QuizOptionColors(
        background: successContainer,
        border: success,
        foreground: onSuccessContainer,
        badgeBackground: success,
        badgeForeground: onSuccess,
      ),
      QuizOptionState.wrong => QuizOptionColors(
        background: errorContainer,
        border: error,
        foreground: onErrorContainer,
        badgeBackground: error,
        badgeForeground: onError,
      ),
      QuizOptionState.disabled => QuizOptionColors(
        background: surfaceRaised,
        border: divider,
        foreground: textMuted,
        badgeBackground: divider,
        badgeForeground: textMuted,
      ),
    };
  }
  Color gradeColor(double ratio) {
    if (ratio >= 0.8) return success;
    if (ratio >= 0.5) return warning;
    return error;
  }
  Color gradeContainer(double ratio) {
    if (ratio >= 0.8) return successContainer;
    if (ratio >= 0.5) return warningContainer;
    return errorContainer;
  }

  @override
  QuizColors copyWith({
    Color? background,
    Color? surface,
    Color? surfaceRaised,
    Color? border,
    Color? divider,
    Color? primary,
    Color? onPrimary,
    Color? primaryContainer,
    Color? onPrimaryContainer,
    Color? secondary,
    Color? onSecondary,
    Color? secondaryContainer,
    Color? onSecondaryContainer,
    Color? textPrimary,
    Color? textSecondary,
    Color? textMuted,
    Color? success,
    Color? onSuccess,
    Color? successContainer,
    Color? onSuccessContainer,
    Color? warning,
    Color? warningContainer,
    Color? onWarningContainer,
    Color? error,
    Color? onError,
    Color? errorContainer,
    Color? onErrorContainer,
    Color? info,
    Color? infoContainer,
    Color? gold,
    Color? onGold,
    Color? goldContainer,
    Color? onGoldContainer,
    Color? shadow,
    Color? imageScrim,
    Color? onImageScrim,
  }) {
    return QuizColors(
      background: background ?? this.background,
      surface: surface ?? this.surface,
      surfaceRaised: surfaceRaised ?? this.surfaceRaised,
      border: border ?? this.border,
      divider: divider ?? this.divider,
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      primaryContainer: primaryContainer ?? this.primaryContainer,
      onPrimaryContainer: onPrimaryContainer ?? this.onPrimaryContainer,
      secondary: secondary ?? this.secondary,
      onSecondary: onSecondary ?? this.onSecondary,
      secondaryContainer: secondaryContainer ?? this.secondaryContainer,
      onSecondaryContainer: onSecondaryContainer ?? this.onSecondaryContainer,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textMuted: textMuted ?? this.textMuted,
      success: success ?? this.success,
      onSuccess: onSuccess ?? this.onSuccess,
      successContainer: successContainer ?? this.successContainer,
      onSuccessContainer: onSuccessContainer ?? this.onSuccessContainer,
      warning: warning ?? this.warning,
      warningContainer: warningContainer ?? this.warningContainer,
      onWarningContainer: onWarningContainer ?? this.onWarningContainer,
      error: error ?? this.error,
      onError: onError ?? this.onError,
      errorContainer: errorContainer ?? this.errorContainer,
      onErrorContainer: onErrorContainer ?? this.onErrorContainer,
      info: info ?? this.info,
      infoContainer: infoContainer ?? this.infoContainer,
      gold: gold ?? this.gold,
      onGold: onGold ?? this.onGold,
      goldContainer: goldContainer ?? this.goldContainer,
      onGoldContainer: onGoldContainer ?? this.onGoldContainer,
      shadow: shadow ?? this.shadow,
      imageScrim: imageScrim ?? this.imageScrim,
      onImageScrim: onImageScrim ?? this.onImageScrim,
    );
  }

  @override
  QuizColors lerp(ThemeExtension<QuizColors>? other, double t) {
    if (other is! QuizColors) return this;
    return QuizColors(
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceRaised: Color.lerp(surfaceRaised, other.surfaceRaised, t)!,
      border: Color.lerp(border, other.border, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      primaryContainer: Color.lerp(primaryContainer, other.primaryContainer, t)!,
      onPrimaryContainer: Color.lerp(onPrimaryContainer, other.onPrimaryContainer, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t)!,
      secondaryContainer: Color.lerp(secondaryContainer, other.secondaryContainer, t)!,
      onSecondaryContainer: Color.lerp(onSecondaryContainer, other.onSecondaryContainer, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textMuted: Color.lerp(textMuted, other.textMuted, t)!,
      success: Color.lerp(success, other.success, t)!,
      onSuccess: Color.lerp(onSuccess, other.onSuccess, t)!,
      successContainer: Color.lerp(successContainer, other.successContainer, t)!,
      onSuccessContainer: Color.lerp(onSuccessContainer, other.onSuccessContainer, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      warningContainer: Color.lerp(warningContainer, other.warningContainer, t)!,
      onWarningContainer: Color.lerp(onWarningContainer, other.onWarningContainer, t)!,
      error: Color.lerp(error, other.error, t)!,
      onError: Color.lerp(onError, other.onError, t)!,
      errorContainer: Color.lerp(errorContainer, other.errorContainer, t)!,
      onErrorContainer: Color.lerp(onErrorContainer, other.onErrorContainer, t)!,
      info: Color.lerp(info, other.info, t)!,
      infoContainer: Color.lerp(infoContainer, other.infoContainer, t)!,
      gold: Color.lerp(gold, other.gold, t)!,
      onGold: Color.lerp(onGold, other.onGold, t)!,
      goldContainer: Color.lerp(goldContainer, other.goldContainer, t)!,
      onGoldContainer: Color.lerp(onGoldContainer, other.onGoldContainer, t)!,
      shadow: Color.lerp(shadow, other.shadow, t)!,
      imageScrim: Color.lerp(imageScrim, other.imageScrim, t)!,
      onImageScrim: Color.lerp(onImageScrim, other.onImageScrim, t)!,
    );
  }
}

extension QuizColorsContext on BuildContext {
  QuizColors get quizColors => Theme.of(this).extension<QuizColors>()!;
}

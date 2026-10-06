import 'package:flutter/material.dart';
import 'quiz_colors.dart';

abstract final class QuizGradients {
  static LinearGradient hero(QuizColors c) => LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [c.primaryContainer, c.background],
  );

  static LinearGradient score(QuizColors c) => LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [c.primary, c.secondary],
  );

  static LinearGradient imageOverlay(QuizColors c) => LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: const [0.0, 0.45, 1.0],
    colors: [
      c.imageScrim.withValues(alpha: 0),
      c.imageScrim.withValues(alpha: 0),
      c.imageScrim,
    ],
  );
}

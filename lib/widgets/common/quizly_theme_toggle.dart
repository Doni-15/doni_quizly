import 'package:flutter/material.dart';
import 'package:quizly/app/theme/quiz_theme_controller.dart';

class QuizlyThemeToggle extends StatelessWidget {
  const QuizlyThemeToggle({super.key, required this.controller});

  final QuizThemeController controller;

  static final _thumbIcon = WidgetStateProperty.resolveWith<Icon?>(
    (states) => Icon(
      states.contains(WidgetState.selected)
          ? Icons.dark_mode
          : Icons.light_mode,
    ),
  );

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Tooltip(
      message: isDark ? 'Ganti ke tema terang' : 'Ganti ke tema gelap',
      child: Switch(
        value: isDark,
        thumbIcon: _thumbIcon,
        onChanged: (_) => controller.toggle(context),
      ),
    );
  }
}

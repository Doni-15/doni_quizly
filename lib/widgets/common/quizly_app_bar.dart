import 'package:flutter/material.dart';
import 'package:quizly/app/theme/quiz_theme_controller.dart';
import 'package:quizly/app/utils/quiz_responsive.dart';
import 'package:quizly/widgets/common/quizly_theme_toggle.dart';

class QuizlyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const QuizlyAppBar({
    super.key,
    this.title,
    this.actions = const [],
    this.showThemeToggle = true,
  });

  final String? title;
  final List<Widget> actions;
  final bool showThemeToggle;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title == null ? null : Text(title!),
      actions: [
        ...actions,
        if (showThemeToggle) QuizlyThemeToggle(controller: themeController),
        SizedBox(width: context.wp(0.02)),
      ],
    );
  }
}
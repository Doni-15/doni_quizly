import 'package:flutter/material.dart';
import 'package:quizly/app/theme/quiz_colors.dart';
import 'package:quizly/app/theme/quiz_theme.dart';
import 'package:quizly/app/utils/quiz_responsive.dart';

class QuizQuestionOptionCard extends StatelessWidget {
  const QuizQuestionOptionCard({
    super.key,
    required this.label,
    required this.text,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final String text;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final c = context.quizColors;
    final f = QuizResponsive.textFactor(context.screenSize);
    final o = c.optionColors(
      selected ? QuizOptionState.selected : QuizOptionState.idle,
    );
    final radius = BorderRadius.circular(QuizTheme.radius);

    return Semantics(
      button: true,
      selected: selected,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: radius,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            curve: Curves.easeOut,
            padding: EdgeInsets.all(14 * f),
            decoration: BoxDecoration(
              color: o.background,
              borderRadius: radius,
              border: Border.all(color: o.border, width: selected ? 2 : 1.5),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildLabel(theme, o, f),
                SizedBox(width: 12 * f),
                Expanded(
                  child: Text(
                    text,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: o.foreground,
                      fontWeight: selected ? FontWeight.w700 : FontWeight.w400,
                    ),
                  ),
                ),
                if (selected) ...[
                  SizedBox(width: 8 * f),
                  Icon(Icons.check_circle, size: 20 * f, color: c.primary),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(ThemeData theme, QuizOptionColors o, double f) {
    return Container(
      width: 32 * f,
      height: 32 * f,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: o.badgeBackground,
        shape: BoxShape.circle,
      ),
      child: Text(
        label,
        style: theme.textTheme.labelLarge?.copyWith(color: o.badgeForeground),
      ),
    );
  }
}

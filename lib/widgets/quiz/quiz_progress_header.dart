import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizly/app/theme/quiz_colors.dart';
import 'package:quizly/app/theme/quiz_theme.dart';
import 'package:quizly/app/utils/quiz_responsive.dart';
import 'package:quizly/providers/quiz_provider.dart';

class QuizProgressHeader extends StatelessWidget {
  const QuizProgressHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final quiz = context.watch<QuizProvider>();
    final theme = Theme.of(context);
    final c = context.quizColors;
    final f = QuizResponsive.textFactor(context.screenSize);

    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16 * f, vertical: 12 * f),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildParticipant(theme, c, f, quiz),
            SizedBox(height: 12 * f),
            _buildProgressLabel(theme, c, quiz),
            SizedBox(height: 8 * f),
            _buildProgressBar(c, f, quiz),
          ],
        ),
      ),
    );
  }

  Widget _buildParticipant(
    ThemeData theme,
    QuizColors c,
    double f,
    QuizProvider quiz,
  ) {
    return Row(
      children: [
        Container(
          width: 32 * f,
          height: 32 * f,
          decoration: BoxDecoration(
            color: c.primaryContainer,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.person, size: 18 * f, color: c.onPrimaryContainer),
        ),
        SizedBox(width: 12 * f),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                quiz.nama,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.titleSmall?.copyWith(
                  color: c.textPrimary,
                ),
              ),
              SizedBox(height: 2 * f),
              Text(
                'NIM ${quiz.nim}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.labelSmall?.copyWith(color: c.textMuted),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Label di kiri, persen di kanan, di baris sendiri -> tidak menekan nama.
  Widget _buildProgressLabel(ThemeData theme, QuizColors c, QuizProvider quiz) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          quiz.progressLabel,
          style: theme.textTheme.labelMedium?.copyWith(color: c.primary),
        ),
        Text(
          '${(quiz.progress * 100).round()}%',
          style: theme.textTheme.labelMedium?.copyWith(color: c.textSecondary),
        ),
      ],
    );
  }

  Widget _buildProgressBar(QuizColors c, double f, QuizProvider quiz) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(QuizTheme.radius),
      child: LinearProgressIndicator(
        value: quiz.progress,
        minHeight: 8 * f,
        backgroundColor: c.divider,
        color: c.primary,
      ),
    );
  }
}

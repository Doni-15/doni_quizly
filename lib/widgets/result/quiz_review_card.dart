import 'package:flutter/material.dart';
import 'package:quizly/app/theme/quiz_colors.dart';
import 'package:quizly/app/theme/quiz_theme.dart';
import 'package:quizly/app/utils/quiz_responsive.dart';
import 'package:quizly/models/quiz_question.dart';

class QuizReviewCard extends StatelessWidget {
  const QuizReviewCard({
    super.key,
    required this.number,
    required this.question,
    required this.selectedOption,
  });

  final int number;
  final QuizQuestion question;
  final QuizOption? selectedOption;

  bool get _isAnswered => selectedOption != null;
  bool get _isCorrect => selectedOption?.isCorrect ?? false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final c = context.quizColors;
    final f = QuizResponsive.textFactor(context.screenSize);

    return Card(
      child: Padding(
        padding: EdgeInsets.all(20 * f),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(theme, c, f),
            SizedBox(height: 12 * f),

            Text(
              question.questionText,
              style: theme.textTheme.titleMedium?.copyWith(
                color: c.textPrimary,
              ),
            ),

            SizedBox(height: 16 * f),
            ..._buildOptions(theme, c, f),
            SizedBox(height: 6 * f),
            _buildExplanation(theme, c, f),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(ThemeData theme, QuizColors c, double f) {
    return Row(
      children: [
        Expanded(
          child: Text(
            'Soal $number',
            style: theme.textTheme.labelLarge?.copyWith(color: c.primary),
          ),
        ),
        _buildStatusChip(theme, c, f),
      ],
    );
  }

  Widget _buildStatusChip(ThemeData theme, QuizColors c, double f) {
    final Color background;
    final Color foreground;
    final IconData icon;
    final String label;

    if (!_isAnswered) {
      background = c.surfaceRaised;
      foreground = c.textSecondary;
      icon = Icons.remove_circle_outline;
      label = 'Tidak dijawab';
    } 
    else if (_isCorrect) {
      background = c.successContainer;
      foreground = c.onSuccessContainer;
      icon = Icons.check_circle;
      label = 'Benar';
    } 
    else {
      background = c.errorContainer;
      foreground = c.onErrorContainer;
      icon = Icons.cancel;
      label = 'Salah';
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12 * f, vertical: 6 * f),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(QuizTheme.radius),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16 * f, color: foreground),
          SizedBox(width: 6 * f),
          Text(
            label,
            style: theme.textTheme.labelMedium?.copyWith(color: foreground),
          ),
        ],
      ),
    );
  }


  List<Widget> _buildOptions(ThemeData theme, QuizColors c, double f) {
    return [
      for (var i = 0; i < question.options.length; i++) ...[
        _buildOption(theme, c, f, question.options[i], i),
        if (i < question.options.length - 1) SizedBox(height: 10 * f),
      ],
    ];
  }

  Widget _buildOption(
    ThemeData theme,
    QuizColors c,
    double f,
    QuizOption option,
    int index,
  ) {
    final isChosen = option.id == selectedOption?.id;

    final QuizOptionState state;
    if (option.isCorrect) {
      state = QuizOptionState.correct;
    } 
    else if (isChosen) {
      state = QuizOptionState.wrong;
    } 
    else {
      state = QuizOptionState.idle;
    }

    final o = c.optionColors(state);
    final tag = _optionTag(option, isChosen);

    return Container(
      padding: EdgeInsets.all(12 * f),
      decoration: BoxDecoration(
        color: o.background,
        borderRadius: BorderRadius.circular(QuizTheme.radius),
        border: Border.all(color: o.border, width: 1.5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBadge(theme, o, f, String.fromCharCode(65 + index)),
          SizedBox(width: 12 * f),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  option.text,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: o.foreground,
                  ),
                ),

                if (tag != null) ...[
                  SizedBox(height: 2 * f),
                  Text(
                    tag,
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: o.foreground,
                    ),
                  ),
                ],
              ],
            ),
          ),

          if (state == QuizOptionState.correct) ...[
            SizedBox(width: 8 * f),
            Icon(Icons.check_circle, size: 20 * f, color: o.border),
          ] 
          else if (state == QuizOptionState.wrong) ...[
            SizedBox(width: 8 * f),
            Icon(Icons.cancel, size: 20 * f, color: o.border),
          ],
        ],
      ),
    );
  }

  Widget _buildBadge(
    ThemeData theme,
    QuizOptionColors o,
    double f,
    String letter,
  ) {
    return Container(
      width: 32 * f,
      height: 32 * f,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: o.badgeBackground,
        shape: BoxShape.circle,
      ),

      child: Text(
        letter,
        style: theme.textTheme.labelLarge?.copyWith(color: o.badgeForeground),
      ),
    );
  }

  String? _optionTag(QuizOption option, bool isChosen) {
    if (isChosen && option.isCorrect) return 'Jawabanmu (benar)';
    if (isChosen) return 'Jawabanmu';
    if (option.isCorrect) return 'Jawaban benar';

    return null;
  }


  Widget _buildExplanation(ThemeData theme, QuizColors c, double f) {
    return Container(
      padding: EdgeInsets.all(12 * f),
      decoration: BoxDecoration(
        color: c.surfaceRaised,
        borderRadius: BorderRadius.circular(QuizTheme.radius),
      ),
      
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.lightbulb_outline, size: 18 * f, color: c.textSecondary),
          SizedBox(width: 10 * f),
          Expanded(
            child: Text(
              question.explanation,
              style: theme.textTheme.bodySmall?.copyWith(
                color: c.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

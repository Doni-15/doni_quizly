import 'package:flutter/material.dart';
import 'package:quizly/app/theme/quiz_colors.dart';
import 'package:quizly/app/utils/quiz_responsive.dart';
import 'package:quizly/models/quiz_question.dart';
import 'package:quizly/widgets/quiz/quiz_question_option_card.dart';

class QuizQuestionCard extends StatelessWidget {
  const QuizQuestionCard({
    super.key,
    required this.questionNumber,
    required this.question,
    required this.selectedOptionId,
    required this.onOptionSelected,
  });

  final int questionNumber;
  final QuizQuestion question;
  final String? selectedOptionId;
  final ValueChanged<String> onOptionSelected;

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
            _buildQuestionHeader(theme, c),
            SizedBox(height: 16 * f),
            _buildQuestionText(theme, c),
            SizedBox(height: 20 * f),
            _buildOptions(f),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionHeader(ThemeData theme, QuizColors c) {
    return Text(
      'Pertanyaan $questionNumber',
      style: theme.textTheme.labelLarge?.copyWith(color: c.primary),
    );
  }

  Widget _buildQuestionText(ThemeData theme, QuizColors c) {
    return Text(
      question.questionText,
      style: theme.textTheme.titleMedium?.copyWith(color: c.textPrimary),
    );
  }

  Widget _buildOptions(double f) {
    return Column(
      children: [
        for (var i = 0; i < question.options.length; i++) ...[
          QuizQuestionOptionCard(
            label: String.fromCharCode(65 + i),
            text: question.options[i].text,
            selected: question.options[i].id == selectedOptionId,
            onTap: () => onOptionSelected(question.options[i].id),
          ),
          if (i < question.options.length - 1) SizedBox(height: 10 * f),
        ],
      ],
    );
  }
}

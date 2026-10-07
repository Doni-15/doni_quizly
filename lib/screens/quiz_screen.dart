import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:quizly/app/routes/quizly_app_routes.dart';
import 'package:quizly/app/utils/quiz_centered_body.dart';
import 'package:quizly/app/utils/quiz_responsive.dart';
import 'package:quizly/providers/quiz_provider.dart';
import 'package:quizly/widgets/common/quizly_app_bar.dart';
import 'package:quizly/widgets/common/quizly_app_button.dart';
import 'package:quizly/widgets/quiz/quiz_progress_header.dart';
import 'package:quizly/widgets/quiz/quiz_question_card.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quiz = context.watch<QuizProvider>();

    return Scaffold(
      appBar: const QuizlyAppBar(title: 'Kuis'),
      body: SafeArea(
        child: QuizCenteredBody(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: _buildContent(context, quiz)),
              _buildActionButton(context, quiz),
              SizedBox(height: context.hp(0.02)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, QuizProvider quiz) {
    return SingleChildScrollView(
      key: ValueKey(quiz.currentIndex),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: context.hp(0.01)),
          const QuizProgressHeader(),
          SizedBox(height: context.hp(0.02)),

          QuizQuestionCard(
            questionNumber: quiz.currentIndex + 1,
            question: quiz.currentQuestion,
            selectedOptionId: quiz.selectedOptionId,
            onOptionSelected: quiz.selectOption,
          ),

          SizedBox(height: context.hp(0.02)),
        ],
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, QuizProvider quiz) {
    if (quiz.isLast) {
      return QuizlyAppButton(
        label: 'Selesai',
        icon: Icons.check,
        onPressed: quiz.canFinish ? () => _onFinish(context, quiz) : null,
      );
    }

    return QuizlyAppButton(
      label: 'Berikutnya',
      icon: Icons.arrow_forward,
      onPressed: quiz.canGoNext ? () => quiz.next() : null,
    );
  }

  void _onFinish(BuildContext context, QuizProvider quiz) {
    if (!quiz.finish()) return;

    context.go(QuizlyAppRoutes.result);
  }
}

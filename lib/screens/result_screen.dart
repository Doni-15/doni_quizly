import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:quizly/app/routes/quizly_app_routes.dart';
import 'package:quizly/app/theme/quiz_colors.dart';
import 'package:quizly/app/utils/quiz_centered_body.dart';
import 'package:quizly/app/utils/quiz_responsive.dart';
import 'package:quizly/models/quiz_grade.dart';
import 'package:quizly/providers/quiz_provider.dart';
import 'package:quizly/widgets/common/quizly_app_bar.dart';
import 'package:quizly/widgets/common/quizly_app_button.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quiz = context.watch<QuizProvider>();

    return Scaffold(
      appBar: const QuizlyAppBar(title: 'Hasil Akhir', showThemeToggle: true),
      body: SafeArea(
        child: QuizCenteredBody(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                vertical: context.hp(0.03),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildScoreCard(context, quiz),
                  SizedBox(height: context.hp(0.04)),
                  
                  _buildReviewButton(context),
                  const SizedBox(height: 16),
                  _buildHomeButton(context, quiz),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildScoreCard(BuildContext context, QuizProvider quiz) {
    final theme = Theme.of(context);
    final c = context.quizColors;
    final f = QuizResponsive.textFactor(context.screenSize);
    final grade = QuizGrade.fromRatio(quiz.scoreRatio);
    final gradeColor = c.gradeColor(quiz.scoreRatio);

    return Card(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              vertical: 32 * f,
              horizontal: 24 * f,
            ),

            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  gradeColor,
                  gradeColor.withValues(alpha: 0.75), 
                ],
              ),
            ),

            child: Column(
              children: [
                Text(
                  'Skor Akhir',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.white.withValues(alpha: 0.9), 
                  ),
                ),

                SizedBox(height: 8 * f),

                Text(
                  '${quiz.score}',
                  style: theme.textTheme.displayLarge?.copyWith(
                    color: Colors.white, 
                    fontSize: 72 * f,
                    height: 1.0,
                  ),
                ),

                SizedBox(height: 16 * f),
                
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16 * f,
                    vertical: 6 * f,
                  ),

                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.25), 
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: Colors.white.withValues(alpha: 0.5)),
                  ),

                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        grade.icon,
                        color: Colors.white,
                        size: 18 * f,
                      ),

                      SizedBox(width: 8 * f),

                      Text(
                        grade.label,
                        style: theme.textTheme.labelLarge?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          _buildInfoStats(context, quiz, theme, c, f),
        ],
      ),
    );
  }

  Widget _buildInfoStats(
    BuildContext context,
    QuizProvider quiz,
    ThemeData theme,
    QuizColors c,
    double f,
  ) {
    return Padding(
      padding: EdgeInsets.all(24 * f),
      child: Column(
        children: [
          Text(
            quiz.nama,
            textAlign: TextAlign.center,
            style: theme.textTheme.titleLarge?.copyWith(
              color: c.textPrimary,
            ),
          ),

          SizedBox(height: 4 * f),

          Text(
            'NIM ${quiz.nim}',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: c.textSecondary,
            ),
          ),

          SizedBox(height: 24 * f),
          const Divider(),
          SizedBox(height: 24 * f),

          Row(
            children: [
              Expanded(
                child: _buildStat(
                  context,
                  icon: Icons.check_circle,
                  iconColor: c.success,
                  label: 'Benar',
                  value: quiz.correctCount,
                  f: f,
                ),
              ),

              Container(
                width: 1,
                height: 40 * f,
                color: c.divider,
              ),

              Expanded(
                child: _buildStat(
                  context,
                  icon: Icons.cancel,
                  iconColor: c.error,
                  label: 'Salah',
                  value: quiz.wrongCount,
                  f: f,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStat(
    BuildContext context, {
    required IconData icon,
    required Color iconColor,
    required String label,
    required int value,
    required double f,
  }) {
    final theme = Theme.of(context);
    final c = context.quizColors;

    return Column(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: 28 * f,
        ),

        SizedBox(height: 8 * f),

        Text(
          '$value',
          style: theme.textTheme.headlineMedium?.copyWith(
            color: c.textPrimary,
            height: 1.1,
          ),
        ),

        Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: c.textMuted,
          ),
        ),
      ],
    );
  }

  Widget _buildReviewButton(BuildContext context) {
    return QuizlyAppButton(
      label: 'Lihat Review Jawaban',
      icon: Icons.fact_check_outlined,
      onPressed: () => context.push(
        QuizlyAppRoutes.review,
      ),
    );
  }

  Widget _buildHomeButton(BuildContext context, QuizProvider quiz) {
    final c = context.quizColors;
    
    return OutlinedButton.icon(
      onPressed: () {
        quiz.restart(); 
        context.go(QuizlyAppRoutes.home);
      },
      
      icon: const Icon(Icons.home_outlined),
      label: const Text('Kembali ke Beranda'),
      style: OutlinedButton.styleFrom(
        foregroundColor: c.textPrimary,
        side: BorderSide(color: c.divider),
      ),
    );
  }
}
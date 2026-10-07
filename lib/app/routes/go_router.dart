import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quizly/app/routes/quizly_app_routes.dart';
import 'package:quizly/providers/quiz_provider.dart';
import 'package:quizly/screens/home_screen.dart';
import 'package:quizly/screens/quiz_screen.dart';
import 'package:quizly/screens/result_screen.dart';
import 'package:quizly/screens/review_screen.dart';

/// Layar kuis hanya boleh dibuka setelah peserta menekan "Mulai" di Home.
String? _requireStarted(BuildContext context, GoRouterState state) {
  if (!quizProvider.hasStarted) return QuizlyAppRoutes.home;
  if (quizProvider.isFinished) return QuizlyAppRoutes.result;

  return null;
}

/// Hasil dan review hanya boleh dibuka setelah semua soal selesai.
String? _requireFinished(BuildContext context, GoRouterState state) {
  if (quizProvider.isFinished) return null;

  return quizProvider.hasStarted ? QuizlyAppRoutes.quiz : QuizlyAppRoutes.home;
}

final GoRouter goRouter = GoRouter(
  initialLocation: QuizlyAppRoutes.home,

  routes: [
    GoRoute(
      path: QuizlyAppRoutes.home,
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),

    GoRoute(
      path: QuizlyAppRoutes.quiz,
      name: 'quiz',
      redirect: _requireStarted,
      builder: (context, state) => const QuizScreen(),
    ),

    GoRoute(
      path: QuizlyAppRoutes.result,
      name: 'result',
      redirect: _requireFinished,
      builder: (context, state) => const ResultScreen(),
    ),

    GoRoute(
      path: QuizlyAppRoutes.review,
      name: 'review',
      redirect: _requireFinished,
      builder: (context, state) => const ReviewScreen(),
    ),
  ],
);

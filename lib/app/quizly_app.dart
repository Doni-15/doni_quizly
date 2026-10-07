import 'package:flutter/material.dart';
import 'package:quizly/app/routes/go_router.dart';
import 'package:quizly/app/theme/quiz_theme.dart';
import 'package:quizly/app/theme/quiz_theme_controller.dart';
import 'package:quizly/app/utils/quiz_responsive.dart';
import 'package:quizly/app/utils/quiz_scroll_behavior.dart';

class QuizlyApp extends StatelessWidget {
  const QuizlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: themeController,
      builder: (context, _) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Quizly',
        theme: QuizTheme.light,
        darkTheme: QuizTheme.dark,
        themeMode: themeController.mode,
        routerConfig: goRouter,
        builder: QuizResponsive.appBuilder,
        scrollBehavior: const QuizScrollBehavior(),
      ),
    );
  }
}

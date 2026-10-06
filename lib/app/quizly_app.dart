import 'package:flutter/material.dart';
import 'package:quizly/app/routes/go_router.dart';
import 'package:quizly/app/theme/quiz_theme.dart';
import 'package:quizly/app/utils/quiz_responsive.dart';

class QuizlyApp extends StatelessWidget {
  const QuizlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Membungkus MaterialApp dengan QuizResponsive untuk menangani skala font dinamis
    return QuizResponsive.appBuilder(
      context,
      MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Quizly',
        theme: QuizTheme.light,
        darkTheme: QuizTheme.dark,
        themeMode: ThemeMode.system,
        routerConfig: goRouter,
      ),
    );
  }
}
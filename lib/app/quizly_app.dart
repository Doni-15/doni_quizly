import 'package:flutter/material.dart';

class QuizlyApp extends StatelessWidget {
  const QuizlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quizly',

      // Next
      // theme: QuizTheme.light,
      // darkTheme: QuizTheme.dark,

      home: Scaffold(),
    );
  }
}
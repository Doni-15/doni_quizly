import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizly/app/quizly_app.dart';
import 'package:quizly/providers/quiz_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider.value(
      value: quizProvider, 
      child: const QuizlyApp()
    ),
  );
}

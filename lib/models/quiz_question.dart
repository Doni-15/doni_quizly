import 'package:flutter/foundation.dart';

@immutable
class QuizOption {
  final String id;
  final String text;
  final bool isCorrect;

  const QuizOption({
    required this.id,
    required this.text,
    required this.isCorrect,
  });
}

@immutable
class QuizQuestion {
  final String id;
  final String questionText;
  final List<QuizOption> options;
  final String explanation;

  const QuizQuestion({
    required this.id,
    required this.questionText,
    required this.options,
    required this.explanation,
  });

  QuizOption get correctOption {
    return options.firstWhere((option) => option.isCorrect);
  }
}

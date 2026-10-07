import 'package:flutter/material.dart';

enum QuizGrade {
  excellent(label: 'Sangat Memuaskan', icon: Icons.emoji_events),

  good(label: 'Cukup Baik', icon: Icons.thumb_up),

  poor(label: 'Perlu Belajar Lagi', icon: Icons.warning_rounded);

  final String label;
  final IconData icon;

  const QuizGrade({required this.label, required this.icon});

  factory QuizGrade.fromRatio(double ratio) {
    if (ratio >= 0.8) return QuizGrade.excellent;
    if (ratio >= 0.5) return QuizGrade.good;
    return QuizGrade.poor;
  }
}

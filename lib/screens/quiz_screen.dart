import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  final String nama;
  final String nim;

  const QuizScreen({
    super.key,
    required this.nama,
    required this.nim,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Ini Halaman Quiz')),
    );
  }
}
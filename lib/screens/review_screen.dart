import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizly/app/utils/quiz_centered_body.dart';
import 'package:quizly/app/utils/quiz_responsive.dart';
import 'package:quizly/providers/quiz_provider.dart';
import 'package:quizly/widgets/common/quizly_app_bar.dart';
import 'package:quizly/widgets/result/quiz_review_card.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final reviews = context.watch<QuizProvider>().reviews;

    return Scaffold(
      appBar: const QuizlyAppBar(title: 'Review Jawaban'),
      body: SafeArea(
        child: QuizCenteredBody(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(vertical: context.hp(0.02)),
            itemCount: reviews.length,
            separatorBuilder: (context, index) => SizedBox(height: context.hp(0.02)),
            
            itemBuilder: (context, index) => QuizReviewCard(
              number: index + 1,
              question: reviews[index].question,
              selectedOption: reviews[index].selectedOption,
            ),
          ),
        ),
      ),
    );
  }
}

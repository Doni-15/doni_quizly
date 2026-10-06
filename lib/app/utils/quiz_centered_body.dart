import 'package:flutter/material.dart';
import 'quiz_responsive.dart';

class QuizCenteredBody extends StatelessWidget {
  const QuizCenteredBody({
    super.key,
    required this.child,
    this.maxWidth = QuizResponsive.maxContentWidth,
  });

  final Widget child;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: QuizResponsive.horizontalPadding(context),
          ),
          child: child,
        ),
      ),
    );
  }
}

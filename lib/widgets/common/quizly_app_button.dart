import 'package:flutter/material.dart';
import 'package:quizly/app/utils/quiz_responsive.dart';

class QuizlyAppButton extends StatelessWidget {
  const QuizlyAppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.isLoading = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final f = QuizResponsive.textFactor(context.screenSize);

    final maxWidth = QuizResponsive.pick<double>(
      context,
      mobile: double.infinity,
      tablet: QuizResponsive.maxButtonWidth,
    );

    return Center(
      heightFactor: 1,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: SizedBox(
          width: double.infinity,
          child: FilledButton(
            onPressed: isLoading ? null : onPressed,
            style: FilledButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: 24 * f,
                vertical: 14 * f,
              ),
              minimumSize: Size(48, (48 * f).clamp(48.0, 64.0).toDouble()),
            ),

            child: isLoading
              ? SizedBox(
                  width: 20 * f,
                  height: 20 * f,
                  child: const CircularProgressIndicator(strokeWidth: 2),
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        label,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    
                    if (icon != null) ...[
                      SizedBox(width: 8 * f),
                      Icon(icon, size: 20 * f),
                    ],
                  ],
                ),
          ),
        ),
      ),
    );
  }
}
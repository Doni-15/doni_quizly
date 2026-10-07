import 'package:flutter/material.dart';
import 'package:quizly/app/theme/quiz_colors.dart';
import 'package:quizly/app/theme/quiz_gradients.dart';
import 'package:quizly/app/utils/quiz_responsive.dart';

class HomePageLogo extends StatelessWidget {
  const HomePageLogo({
    super.key,
    this.assetPath = defaultAssetPath,
    this.size,
    this.title,
  });

  static const String defaultAssetPath = 'assets/images/app_logo.png';
  static const double _minSize = 96;
  static const double _maxSize = 160;

  final String assetPath;
  final double? size;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final c = context.quizColors;
    final logoSize =
        size ?? context.sp(0.28).clamp(_minSize, _maxSize).toDouble();

    final logo = Image.asset(
      assetPath,
      width: logoSize,
      height: logoSize,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) => _placeholder(c, logoSize),
    );

    return Semantics(
      label: 'Logo ${title ?? 'Quizly'}',
      image: true,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          logo,
          if (title != null) ...[
            SizedBox(height: logoSize * 0.15),
            Text(
              title!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ],
      ),
    );
  }

  Widget _placeholder(QuizColors c, double s) {
    return Container(
      width: s,
      height: s,
      decoration: BoxDecoration(
        gradient: QuizGradients.score(c),
        borderRadius: BorderRadius.circular(s * 0.25),
      ),
      child: Icon(Icons.quiz_rounded, size: s * 0.5, color: c.onPrimary),
    );
  }
}

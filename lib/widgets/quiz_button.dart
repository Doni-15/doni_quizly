import 'package:flutter/material.dart';

import '../app/utils/quiz_responsive.dart';

enum QuizButtonVariant { filled, outlined, text }

/// Tombol yang ukurannya ikut layar.
/// - Padding dan tinggi minimal diskalakan dengan faktor yang sama dengan teks
///   (QuizResponsive.textFactor), jadi tombol dan tulisannya selalu seimbang.
/// - Tinggi minimal tidak pernah di bawah 48 (area sentuh aman).
/// - Mobile: selebar parent. Tablet/desktop: dibatasi 360 agar tidak melebar.
/// Warna, radius, dan font tetap diambil dari tema (QuizTheme).
class QuizButton extends StatelessWidget {
  const QuizButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.variant = QuizButtonVariant.filled,
    this.expand = true,
  });

  final String label;
  final VoidCallback? onPressed; // null = tombol nonaktif
  final IconData? icon;
  final QuizButtonVariant variant;

  /// true  = melebar sesuai aturan responsif di atas.
  /// false = selebar isinya (aman dipakai di dalam Row).
  final bool expand;

  @override
  Widget build(BuildContext context) {
    final factor = QuizResponsive.textFactor(context.screenSize);

    final style = ButtonStyle(
      padding: WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 24 * factor, vertical: 14 * factor),
      ),
      minimumSize: WidgetStatePropertyAll(
        Size(48, (48 * factor).clamp(48.0, 64.0).toDouble()),
      ),
    );

    final text = Text(label, textAlign: TextAlign.center, maxLines: 2);

    final Widget button = switch (variant) {
      QuizButtonVariant.filled => icon == null
          ? FilledButton(onPressed: onPressed, style: style, child: text)
          : FilledButton.icon(
              onPressed: onPressed,
              style: style,
              icon: Icon(icon),
              label: text,
            ),
      QuizButtonVariant.outlined => icon == null
          ? OutlinedButton(onPressed: onPressed, style: style, child: text)
          : OutlinedButton.icon(
              onPressed: onPressed,
              style: style,
              icon: Icon(icon),
              label: text,
            ),
      QuizButtonVariant.text => icon == null
          ? TextButton(onPressed: onPressed, style: style, child: text)
          : TextButton.icon(
              onPressed: onPressed,
              style: style,
              icon: Icon(icon),
              label: text,
            ),
    };

    if (!expand) return button;

    final maxWidth = QuizResponsive.pick<double>(
      context,
      mobile: double.infinity,
      tablet: 360,
      desktop: 360,
    );

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: SizedBox(width: double.infinity, child: button),
    );
  }
}

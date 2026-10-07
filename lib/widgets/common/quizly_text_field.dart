import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizly/app/utils/quiz_responsive.dart';

class QuizlyTextField extends StatelessWidget {
  const QuizlyTextField({
    super.key,
    required this.label,
    this.hint,
    this.icon,
    this.controller,
    this.keyboardType,
    this.textInputAction,
    this.inputFormatters,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.maxLength,
    this.enabled = true,
    this.autofocus = false,
  });

  final String label;
  final String? hint;
  final IconData? icon;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final int? maxLength;
  final bool enabled;
  final bool autofocus;

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

        child: TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          inputFormatters: inputFormatters,
          validator: validator,
          onChanged: onChanged,
          onFieldSubmitted: onSubmitted,
          maxLength: maxLength,
          enabled: enabled,
          autofocus: autofocus,

          decoration: InputDecoration(
            labelText: label,
            hintText: hint,
            prefixIcon: icon == null 
              ? null 
              : Icon(icon, size: 22 * f),

            contentPadding: EdgeInsets.symmetric(
              horizontal: 16 * f,
              vertical: 16 * f,
            ),

            counterText: '',
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:quizly/app/routes/quizly_app_routes.dart';
import 'package:quizly/app/utils/quiz_responsive.dart';
import 'package:quizly/widgets/common/quizly_app_bar.dart';
import 'package:quizly/widgets/common/quizly_app_button.dart';
import 'package:quizly/widgets/common/quizly_text_field.dart';
import 'package:quizly/widgets/home/quizly_logo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _namaC = TextEditingController();
  final _nimC = TextEditingController();

  @override
  void dispose() {
    _namaC.dispose();
    _nimC.dispose();
    super.dispose();
  }

  bool get _isFormValid => _namaC.text.trim().isNotEmpty && _nimC.text.trim().isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, 
      
      appBar: const QuizlyAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: QuizResponsive.horizontalPadding(context),
          ),
          
          child: Align(
            alignment: const Alignment(0, -0.15), 
            
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const QuizlyLogo(),
                  SizedBox(height: context.hp(0.1)),

                  _buildNameField(),
                  SizedBox(height: context.hp(0.02)),

                  _buildNimField(),
                  SizedBox(height: context.hp(0.04)),

                  ListenableBuilder(
                    listenable: Listenable.merge([_namaC, _nimC]),
                    builder: (context, _) => _buildStartButton(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildNameField() {
    return QuizlyTextField(
      label: 'Nama',
      hint: 'Masukkan nama lengkap',
      icon: Icons.person_outline,
      controller: _namaC,
      textInputAction: TextInputAction.next,
    );
  }

  Widget _buildNimField() {
    return QuizlyTextField(
      label: 'NIM',
      hint: 'Contoh: 241401037',
      icon: Icons.badge_outlined,
      controller: _nimC,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      maxLength: 15,
      textInputAction: TextInputAction.done,
    );
  }

  Widget _buildStartButton(BuildContext context) {
    return QuizlyAppButton(
      label: 'Mulai Kuis',
      icon: Icons.play_arrow,
      onPressed: _isFormValid
        ? () => context.go(
            QuizlyAppRoutes.quiz,
            extra: {
              'nama': _namaC.text.trim(),
              'nim': _nimC.text.trim(),
            },
          )
        : null,
    );
  }
}
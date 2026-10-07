import 'package:go_router/go_router.dart';
import 'package:quizly/app/routes/quizly_app_routes.dart';
import 'package:quizly/screens/home_screen.dart';
import 'package:quizly/screens/quiz_screen.dart';
import 'package:quizly/screens/result_screen.dart';
import 'package:quizly/screens/review_screen.dart';

final GoRouter goRouter = GoRouter(
  initialLocation: QuizlyAppRoutes.home,
  
  routes: [
    GoRoute(
      path: QuizlyAppRoutes.home,
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),

    GoRoute(
      path: QuizlyAppRoutes.quiz,
      name: 'quiz',
      builder: (context, state) {
        final args = state.extra as Map<String, dynamic>? ?? {};
        
        return QuizScreen(
          nama: args['nama'] ?? 'Peserta Tanpa Nama',
          nim: args['nim'] ?? '-',
        );
      },
    ),

    GoRoute(
      path: QuizlyAppRoutes.result,
      name: 'result',
      builder: (context, state) => const ResultScreen(),
    ),

    GoRoute(
      path: QuizlyAppRoutes.review,
      name: 'review',
      builder: (context, state) => const ReviewScreen(),
    ),
    
  ],
);
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quizly/app/theme/quiz_theme.dart';
import 'package:quizly/screens/home_screen.dart';

void main() {
  Widget createTestWidget() {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: QuizTheme.light,
      home: const HomeScreen(),
    );
  }

  group('HomeScreen', () {
    testWidgets('menampilkan form data diri', (tester) async {
      await tester.pumpWidget(createTestWidget());

      expect(find.text('Masukkan Data Diri'), findsOneWidget);
      expect(find.text('Nama Lengkap'), findsOneWidget);
      expect(find.text('NIM'), findsOneWidget);
      expect(find.text('Mulai Kuis Sekarang'), findsOneWidget);
    });

    testWidgets('tombol mulai kuis disabled ketika form kosong', (
      tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      final button = tester.widget<FilledButton>(
        find.byType(FilledButton),
      );

      expect(button.onPressed, isNull);
    });

    testWidgets('tombol mulai kuis enabled setelah nama dan NIM diisi', (
      tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      final fields = find.byType(TextFormField);

      expect(fields, findsNWidgets(2));

      await tester.enterText(fields.at(0), 'Doni');
      await tester.enterText(fields.at(1), '241401123');
      await tester.pump();

      final button = tester.widget<FilledButton>(
        find.byType(FilledButton),
      );

      expect(button.onPressed, isNotNull);
    });

    testWidgets('NIM hanya menerima angka', (tester) async {
      await tester.pumpWidget(createTestWidget());

      final fields = find.byType(TextFormField);

      expect(fields, findsNWidgets(2));

      final nimField = fields.at(1);

      await tester.enterText(nimField, '24140abc1123');
      await tester.pump();

      expect(
        tester.widget<TextFormField>(nimField).controller?.text,
        '241401123',
      );
    });
  });
}

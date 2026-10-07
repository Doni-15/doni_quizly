import 'package:flutter/foundation.dart';
import 'package:quizly/data/quiz_data.dart';
import 'package:quizly/models/quiz_question.dart';

@immutable
class QuizAnswerReview {
  const QuizAnswerReview({
    required this.question,
    required this.selectedOption,
  });

  final QuizQuestion question;
  final QuizOption? selectedOption;

  bool get isAnswered => selectedOption != null;
  bool get isCorrect => selectedOption?.isCorrect ?? false;
}

class QuizProvider extends ChangeNotifier {
  QuizProvider({List<QuizQuestion> questions = quizQuestions})
    : assert(questions.isNotEmpty, 'Daftar soal tidak boleh kosong.'),
      assert(
        _isValid(questions),
        'Data soal tidak valid: id soal/opsi harus unik, '
        'minimal 2 opsi, dan tepat 1 jawaban benar per soal.',
      ),
      _questions = List.unmodifiable(questions);

  static bool _isValid(List<QuizQuestion> questions) {
    final questionIds = <String>{};

    for (final question in questions) {
      if (!questionIds.add(question.id)) return false;
      if (question.options.length < 2) return false;

      final optionIds = question.options.map((option) => option.id).toSet();

      if (optionIds.length != question.options.length) return false;

      final correctCount = question.options
        .where((option) => option.isCorrect)
        .length;

      if (correctCount != 1) return false;
    }

    return true;
  }

  final List<QuizQuestion> _questions;

  String _nama = '';
  String _nim = '';

  bool _started = false;
  bool _isFinished = false;

  int _currentIndex = 0;
  int _correctCount = 0;

  final Map<String, String> _selected = {};

  String get nama => _nama;
  String get nim => _nim;

  bool get hasStarted => _started;
  bool get isFinished => _isFinished;

  List<QuizQuestion> get questions => _questions;

  int get total => _questions.length;
  int get currentIndex => _currentIndex;

  QuizQuestion get currentQuestion => _questions[_currentIndex];

  bool get isFirst => _currentIndex == 0;
  bool get isLast => _currentIndex == total - 1;
  double get progress => _selected.length / total;

  String get progressLabel => 'Soal ${_currentIndex + 1} dari $total';
  String? get selectedOptionId => _selected[currentQuestion.id];

  bool get hasSelection => selectedOptionId != null;
  bool get canGoNext => _started && !_isFinished && hasSelection && !isLast;
  bool get canFinish => _started && !_isFinished && hasSelection && isLast;

  int get correctCount => _correctCount;

  int get wrongCount {
    if (!isFinished) return 0;

    return total - _correctCount;
  }

  double get scoreRatio {
    if (!isFinished) return 0;

    return _correctCount / total;
  }

  int get score => (scoreRatio * 100).round();

  List<QuizAnswerReview> get reviews {
    return _questions.map((question) {
      return QuizAnswerReview(
        question: question,
        selectedOption: _selectedOptionOf(question),
      );
    }).toList();
  }

  void start({required String nama, required String nim}) {
    _nama = nama.trim();
    _nim = nim.trim();

    _started = true;

    _resetProgress();
    notifyListeners();
  }

  void restart() {
    _resetProgress();
    notifyListeners();
  }

  void selectOption(String optionId) {
    if (!_started || _isFinished) return;

    final optionExists = currentQuestion.options.any(
      (option) => option.id == optionId,
    );

    if (!optionExists) return;
    if (_selected[currentQuestion.id] == optionId) return;

    _selected[currentQuestion.id] = optionId;
    notifyListeners();
  }

  bool next() {
    if (!canGoNext) return false;

    _currentIndex++;
    notifyListeners();
    return true;
  }

  bool finish() {
    if (!canFinish) return false;

    _calculateResult();
    _isFinished = true;
    notifyListeners();
    return true;
  }

  void _calculateResult() {
    _correctCount = 0;

    for (final question in _questions) {
      final selectedOption = _selectedOptionOf(question);

      if (selectedOption?.isCorrect ?? false) {
        _correctCount++;
      }
    }
  }

  void _resetProgress() {
    _currentIndex = 0;
    _correctCount = 0;
    _isFinished = false;

    _selected.clear();
  }

  QuizOption? _selectedOptionOf(QuizQuestion question) {
    final selectedId = _selected[question.id];

    if (selectedId == null) return null;

    for (final option in question.options) {
      if (option.id == selectedId) {
        return option;
      }
    }

    return null;
  }
}

final quizProvider = QuizProvider();

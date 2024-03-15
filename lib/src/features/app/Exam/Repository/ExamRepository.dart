import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:untitled/src/features/app/Exam/models/Option.dart';
import '../models/Question.dart';

class ExamRepository {
  // Generate dummy questions for demonstration
  final List<Question> questions = List.generate(10, (index) {
    return Question(
      id: index + 1,
      question: 'Question ${index + 1}',
      options: [
        Option(id: 0, option: 'option', isCorrectOption: false),
        Option(id: 1, option: 'option', isCorrectOption: false),
        Option(id: 2, option: 'option', isCorrectOption: false),
        Option(id: 3, option: 'option', isCorrectOption: false),
      ],
      correctOption: Random().nextInt(4),
      description: '',
      images: [],
    );
  });
  Future<List<Question>> getQuestions(String subjectName) async {
    // Simulate fetching questions from a remote server
    await Future.delayed(const Duration(seconds: 1));

    return questions;
  }

  Future<void> submitExam(Map<int, int> selectedOptions) async {
    // Simulate submitting exam and calculating score
    await Future.delayed(const Duration(seconds: 1));

    int correctAnswers = 0;
    selectedOptions.forEach((questionId, selectedOptionIndex) {
      // Compare selected option with correct option
      if (selectedOptionIndex == questions[questionId].correctOption) {
        correctAnswers++;
      }
    });

    // Calculate and print score
    final score = (correctAnswers / selectedOptions.length) * 400;
    if (kDebugMode) {
      print('Score: $score');
    }
  }
}

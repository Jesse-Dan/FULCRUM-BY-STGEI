import 'package:untitled/src/modules/app/Exam/models/Exam.dart';

import '../../../../reusable/enums/enums.dart';
import 'Question.dart';
import 'Subjects.dart';

class ExamVariables {
  Exam? exam;

  late Subject? currentSubject;

  late Question? currentQuestion;

  late List<Subject>? selectedSubjects;

  late Duration? remainingTime;

  /// int- question id, int- answer id
  late Map<int, int> selectedOptions;

  ExamVariables({
    this.remainingTime,
    this.currentQuestion,
    this.selectedSubjects,
    this.currentSubject,
    this.exam,
    this.selectedOptions = const {},
  }) {
    currentSubject = selectedSubjects?[0];
    currentQuestion = selectedSubjects?[0].questions[0];

    remainingTime = exam?.examMode == ExamMode.Exam
        ? exam?.examDuration
        : exam?.traningDuration;
  }

  ExamVariables copyWith({
    Exam? exam,
    Subject? currentSubject,
    Question? currentQuestion,
    List<Subject>? selectedSubjects,
    Duration? remainingTime,
    Map<int, int>? selectedOptions,
  }) {
    return ExamVariables(
      exam: exam ?? this.exam,
      currentSubject: currentSubject ?? this.currentSubject,
      currentQuestion: currentQuestion ?? this.currentQuestion,
      selectedSubjects: selectedSubjects ?? this.selectedSubjects,
      remainingTime: remainingTime ?? this.remainingTime,
      selectedOptions: selectedOptions ?? this.selectedOptions,
    );
  }
}

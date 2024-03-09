import '../../../../enums/enums.dart';
import 'Exam.dart';
import 'Question.dart';

class Subject {
  final String name;
  final bool compulsary;
  final List<ExamType> examtypes;
  final List<Question> questions;

  Subject(
      {required this.name,
      required this.compulsary,
      required this.examtypes,
      required this.questions});
}

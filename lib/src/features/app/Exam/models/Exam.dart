import 'package:untitled/src/features/app/Exam/models/Subjects.dart';
import '../../../../../data/UserData.dart';
import '../../../../enums/enums.dart';
import 'Novel.dart';
import 'Syllabus.dart';
import 'History.dart';

class Exam {
  final int id;
  final String name;
  final String description;
  final ExamType examType;
  bool selected;
  final List<Subject> subjects;
  List<History>? history;
  final List<Novel>? examNovels;
  final Syllabus syllabus;
  final Duration duration;
  final String examInstructions;

  Exam({
    required this.id,
    required this.name,
    required this.description,
    required this.examType,
    required this.subjects,
    required this.syllabus,
    required this.duration,
    required this.examInstructions,
    this.examNovels,
    this.history,
    required this.selected,
  });
}

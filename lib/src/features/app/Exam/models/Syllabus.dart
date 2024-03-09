
import 'Subjects.dart';

class Syllabus {
  final int id;
  final Map<Subject, Map<String, Map<String, List<String>>>>? syllabus;

  Syllabus({required this.id, required this.syllabus});
}

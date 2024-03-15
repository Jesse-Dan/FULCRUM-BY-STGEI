import 'package:untitled/src/features/app/Exam/models/Subjects.dart';
import '../../../../enums/enums.dart';
import 'Novel.dart';
import 'Syllabus.dart';
import 'History.dart';

class Exam {
  final int id;
  final String name;
  final String description;
  final ExamType examType;
  ExamMode examMode;

  /// (max,min)
  final (int, int) subjectRange;
  bool selected;
  final List<Subject> subjects;
  List<History>? history;
  final List<Novel>? examNovels;
  final Syllabus syllabus;
  final String examInstructions;
  final String trainingInstructions;

  final Duration traningDuration;
  final Duration examDuration;

  Exam({
    required this.id,
    required this.name,
    required this.description,
    required this.examType,
    required this.subjects,
    required this.syllabus,
    required this.examInstructions,
    this.examNovels,
    this.history,
    required this.selected,
    required this.examMode,
    required this.trainingInstructions,
    required this.subjectRange,
    required this.traningDuration,
    required this.examDuration,
  });
}

List<Exam> exams = [
  JambExam(id: 0, selected: false),
  WaecExam(id: 1, selected: false),
  AccuracyExam(id: 3, selected: false),
  SpeedExam(id: 3, selected: false)
];

class JambExam extends Exam {
  JambExam({
    required int id,
    required bool selected,
  }) : super(
            id: id,
            name: 'JAMB Exam',
            subjectRange: (4, 4),
            description:
                'Joint Admissions and Matriculations Board (JAMB) Exam',
            examType: ExamType.JAMB,
            subjects: AllSubjects,
            syllabus: JambSyllabus,
            examInstructions: 'Follow the instructions carefully.',
            selected: selected,
            traningDuration: const Duration(minutes: 45),
            examDuration: const Duration(minutes: 180),
            examMode: ExamMode.Training, // Set the exam mode as needed
            trainingInstructions:
                'You will be given 20 questions in english Language and 10 questions on each of the other subjects (a total of 50 questions). The questions will be presented 1 each in series starting with English language. Once you have answered a question you are required to click "Next" to move to the next question and "Finish" when you are done with all questions. if at anytime  you can nolonger continue, you can click on "Quit Exam" to see the performance analysis.\n\nYou will be given 35 minutes to answer all 50 questions and submit. if at any point youre unable to finish on time, you will be automatically shown the summary of your performance.\n\nKeep trying everytime, everyday and JAMB, WAEC, NECO, NABTEB exams will be a walk-over for you. To start now the "Start Exam" button below.');
}

class WaecExam extends Exam {
  WaecExam({
    required int id,
    required bool selected,
  }) : super(
            id: id,
            name: 'WAEC Exam',
            description: 'West African Examinations Council (WAEC) Exam',
            examType: ExamType.WAEC,
            subjectRange: (9, 5),
            subjects: AllSubjects,
            syllabus: JambSyllabus,
            examInstructions: 'Follow the instructions carefully.',
            selected: selected,
            traningDuration: const Duration(minutes: 45),
            examDuration: const Duration(minutes: 180),
            examMode: ExamMode.Exam, // Set the exam mode as needed
            trainingInstructions:
                'You will be given 20 questions in english Language and 10 questions on each of the other subjects (a total of 50 questions). The questions will be presented 1 each in series starting with English language. Once you have answered a question you are required to click "Next" to move to the next question and "Finish" when you are done with all questions. if at anytime  you can nolonger continue, you can click on "Quit Exam" to see the performance analysis.\n\nYou will be given 35 minutes to answer all 50 questions and submit. if at any point youre unable to finish on time, you will be automatically shown the summary of your performance.\n\nKeep trying everytime, everyday and JAMB, WAEC, NECO, NABTEB exams will be a walk-over for you. To start now the "Start Exam" button below.');
}

class AccuracyExam extends Exam {
  AccuracyExam({
    required int id,
    required bool selected,
  }) : super(
            id: id,
            name: 'Accuracy Exam',
            description: 'Exam focused on accuracy',
            examType: ExamType.OTHERS, // Update as needed
            subjectRange: (20, 20),
            subjects: AllSubjects,
            syllabus: JambSyllabus,
            examInstructions: 'Focus on accuracy.',
            selected: selected,
            traningDuration: const Duration(minutes: 45),
            examDuration: const Duration(seconds: 180),
            examMode: ExamMode.Training, // Set the exam mode as needed
            trainingInstructions:
                'You will be given 20 questions in english Language and 10 questions on each of the other subjects (a total of 50 questions). The questions will be presented 1 each in series starting with English language. Once you have answered a question you are required to click "Next" to move to the next question and "Finish" when you are done with all questions. if at anytime  you can nolonger continue, you can click on "Quit Exam" to see the performance analysis.\n\nYou will be given 35 minutes to answer all 50 questions and submit. if at any point youre unable to finish on time, you will be automatically shown the summary of your performance.\n\nKeep trying everytime, everyday and JAMB, WAEC, NECO, NABTEB exams will be a walk-over for you. To start now the "Start Exam" button below.');
}

class SpeedExam extends Exam {
  SpeedExam({
    required int id,
    required bool selected,
  }) : super(
            id: id,
            name: 'Speed Exam',
            description: 'Exam focused on speed',
            subjectRange: (4, 4),
            examType: ExamType.OTHERS, // Update as needed
            subjects: AllSubjects,
            syllabus: JambSyllabus,
            examInstructions: 'Focus on speed.',
            selected: selected,
            traningDuration: const Duration(minutes: 45),
            examDuration: const Duration(seconds: 180),
            examMode: ExamMode.Training, // Set the exam mode as needed
            trainingInstructions:
                'You will be given 20 questions in english Language and 10 questions on each of the other subjects (a total of 50 questions). The questions will be presented 1 each in series starting with English language. Once you have answered a question you are required to click "Next" to move to the next question and "Finish" when you are done with all questions. if at anytime  you can nolonger continue, you can click on "Quit Exam" to see the performance analysis.\n\nYou will be given 35 minutes to answer all 50 questions and submit. if at any point youre unable to finish on time, you will be automatically shown the summary of your performance.\n\nKeep trying everytime, everyday and JAMB, WAEC, NECO, NABTEB exams will be a walk-over for you. To start now the "Start Exam" button below.');
}


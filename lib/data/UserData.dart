import '../src/features/app/Exam/models/Subjects.dart';

class User {
  final String studentCode;
  final String firstName;
  final String lastName;
  final String password;
  final String phoneNumber;
  final List<String> subjectCombination;
  final DateTime dob;
  final DateTime registerdAt;
  final Map<User, List<Map<dynamic, bool>>>? bookmark;
  final List<Subject>? chosenSubjects;

  User({
    required this.studentCode,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.phoneNumber,
    required this.subjectCombination,
    required this.dob,
    required this.registerdAt,
    this.bookmark,
    this.chosenSubjects,
  });
}

var user = User(
    studentCode: 'SAGM205923',
    firstName: 'Jesse',
    lastName: 'Dan',
    password: 'Iloveu2123.',
    phoneNumber: '090688114392',
    subjectCombination: ['Phy', 'Chem', 'Maths', 'Eng'],
    dob: DateTime(2004),
    registerdAt: DateTime(2024));

import '../core/sql/sqlBuilder.dart';
import '../core/sql/sqlConnection.dart';
import '../features/app/Exam/models/Subjects.dart';

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

  // Database interaction (replace with your specific implementation)
  Future<void> createUser(User user) async {
    final conn = await SqlConnection.connect();
    SqlQueryBuilder builder = SqlQueryBuilder();
    final stmt = builder
        .insert()
        .into()
        .leftB()
        .param('firstName, lastName')
        .rightB()
        .values()
        .leftB()
        .param('${user.firstName}, ${user.lastName}')
        .rightB()
        .buildStmt();

    await conn.execute(stmt);
  }

  static const queries = [
    '''
   CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    studentCode TEXT NOT NULL,
    firstName TEXT NOT NULL,
    lastName TEXT NOT NULL,
    password TEXT NOT NULL,
    phoneNumber TEXT NOT NULL,
    dob TEXT NOT NULL,
    registeredAt TEXT NOT NULL
);''',
    '''
    
    '''
  ];
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

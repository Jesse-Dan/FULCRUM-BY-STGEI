import '../../../../enums/enums.dart';
import 'Exam.dart';
import 'Option.dart';
import 'Question.dart';

typedef Subjects = List<Subject>;

class Subject {
  final String name;
  final bool compulsory;
  final List<ExamType> examTypes;
  final List<Question> questions;
  bool? selected;

  Subject(
      {required this.name,
      required this.compulsory,
      required this.examTypes,
      required this.questions,
      required this.selected});
}

// Add 10 subjects
final List<Subject> AllSubjects = [
  Subject(
    name: 'English Language',
    selected: true,
    examTypes: [ExamType.JAMB, ExamType.WAEC, ExamType.OTHERS],
    questions: englishQuestions,
    compulsory: true,
  ),
  Subject(
    name: 'Physics',
    selected: false,
    examTypes: [ExamType.JAMB, ExamType.WAEC],
    questions: List.generate(
      50,
      (index) => Question(
        id: index + 1,
        question: " PhysicsQuestion [${index + 1}]?",
        description: " Physics Description [${index + 1}]",
        images: [],
        options: [
          Option(
              id: 1, option: "Option 1 [${index + 1}]", isCorrectOption: false),
          Option(
              id: 2, option: "Option 2 [${index + 1}]", isCorrectOption: true),
          Option(
              id: 3, option: "Option 3 [${index + 1}]", isCorrectOption: false),
          Option(
              id: 4, option: "Option 4 [${index + 1}]", isCorrectOption: false),
        ],
        correctOption: 2,
      ),
    ),
    compulsory: false,
  ),
  Subject(
    name: 'Chemistry',
    selected: false,
    examTypes: [ExamType.JAMB, ExamType.WAEC],
    questions: List.generate(
      50,
      (index) => Question(
        id: index + 1,
        question: " Chemistry Question [${index + 1}]?",
        description: " Chemistry Description [${index + 1}]",
        images: [],
        options: [
          Option(
              id: 1, option: "Option 1 [${index + 1}]", isCorrectOption: false),
          Option(
              id: 2, option: "Option 2 [${index + 1}]", isCorrectOption: true),
          Option(
              id: 3, option: "Option 3 [${index + 1}]", isCorrectOption: false),
          Option(
              id: 4, option: "Option 4 [${index + 1}]", isCorrectOption: false),
        ],
        correctOption: 2,
      ),
    ),
    compulsory: false,
  ),
  Subject(
    name: 'Biology',
    selected: false,
    examTypes: [ExamType.JAMB, ExamType.WAEC],
    questions: List.generate(
      50,
      (index) => Question(
        id: index + 1,
        question: " Biology Question [${index + 1}]?",
        description: " Biology Description [${index + 1}]",
        images: [],
        options: [
          Option(
              id: 1, option: "Option 1 [${index + 1}]", isCorrectOption: false),
          Option(
              id: 2, option: "Option 2 [${index + 1}]", isCorrectOption: true),
          Option(
              id: 3, option: "Option 3 [${index + 1}]", isCorrectOption: false),
          Option(
              id: 4, option: "Option 4 [${index + 1}]", isCorrectOption: false),
        ],
        correctOption: 2,
      ),
    ),
    compulsory: false,
  ),
  Subject(
    name: 'Mathematics',
    selected: false,
    examTypes: [ExamType.JAMB, ExamType.WAEC],
    questions: List.generate(
      50,
      (index) => Question(
        id: index + 1,
        question: " Mathematics Question [${index + 1}]?",
        description: " Mathematics Description [${index + 1}]",
        images: [],
        options: [
          Option(
              id: 1, option: "Option 1 [${index + 1}]", isCorrectOption: false),
          Option(
              id: 2, option: "Option 2 [${index + 1}]", isCorrectOption: true),
          Option(
              id: 3, option: "Option 3 [${index + 1}]", isCorrectOption: false),
          Option(
              id: 4, option: "Option 4 [${index + 1}]", isCorrectOption: false),
        ],
        correctOption: 2,
      ),
    ),
    compulsory: true,
  ),
  Subject(
    name: 'Government',
    selected: false,
    examTypes: [ExamType.JAMB, ExamType.WAEC],
    questions: List.generate(
      50,
      (index) => Question(
        id: index + 1,
        question: " Government Question [${index + 1}]?",
        description: " Government Description [${index + 1}]",
        images: [],
        options: [
          Option(
              id: 1, option: "Option 1 [${index + 1}]", isCorrectOption: false),
          Option(
              id: 2, option: "Option 2 [${index + 1}]", isCorrectOption: true),
          Option(
              id: 3, option: "Option 3 [${index + 1}]", isCorrectOption: false),
          Option(
              id: 4, option: "Option 4 [${index + 1}]", isCorrectOption: false),
        ],
        correctOption: 2,
      ),
    ),
    compulsory: false,
  ),
  Subject(
    name: 'Economics',
    selected: false,
    examTypes: [ExamType.JAMB, ExamType.WAEC],
    questions: List.generate(
      50,
      (index) => Question(
        id: index + 1,
        question: " Economics Question [${index + 1}]?",
        description: " Economics Description [${index + 1}]",
        images: [],
        options: [
          Option(
              id: 1, option: "Option 1 [${index + 1}]", isCorrectOption: false),
          Option(
              id: 2, option: "Option 2 [${index + 1}]", isCorrectOption: true),
          Option(
              id: 3, option: "Option 3 [${index + 1}]", isCorrectOption: false),
          Option(
              id: 4, option: "Option 4 [${index + 1}]", isCorrectOption: false),
        ],
        correctOption: 2,
      ),
    ),
    compulsory: false,
  ),
  Subject(
    name: 'Geography',
    selected: false,
    examTypes: [ExamType.JAMB, ExamType.WAEC],
    questions: List.generate(
      50,
      (index) => Question(
        id: index + 1,
        question: " Geography Question [${index + 1}]?",
        description: " Geography Description [${index + 1}]",
        images: [],
        options: [
          Option(
              id: 1, option: "Option 1 [${index + 1}]", isCorrectOption: false),
          Option(
              id: 2, option: "Option 2 [${index + 1}]", isCorrectOption: true),
          Option(
              id: 3, option: "Option 3 [${index + 1}]", isCorrectOption: false),
          Option(
              id: 4, option: "Option 4 [${index + 1}]", isCorrectOption: false),
        ],
        correctOption: 2,
      ),
    ),
    compulsory: false,
  ),
  Subject(
    name: 'Literature in English',
    selected: false,
    examTypes: [ExamType.JAMB, ExamType.WAEC],
    questions: List.generate(
      50,
      (index) => Question(
        id: index + 1,
        question: " Literature in English Question [${index + 1}]?",
        description: " Literature in English Description [${index + 1}]",
        images: [],
        options: [
          Option(
              id: 1, option: "Option 1 [${index + 1}]", isCorrectOption: false),
          Option(
              id: 2, option: "Option 2 [${index + 1}]", isCorrectOption: true),
          Option(
              id: 3, option: "Option 3 [${index + 1}]", isCorrectOption: false),
          Option(
              id: 4, option: "Option 4 [${index + 1}]", isCorrectOption: false),
        ],
        correctOption: 2,
      ),
    ),
    compulsory: false,
  ),
  Subject(
    name: 'Christian Religious Studies',
    selected: false,
    examTypes: [ExamType.JAMB, ExamType.WAEC],
    questions: List.generate(
      50,
      (index) => Question(
        id: index + 1,
        question: " Christian Religious Studies Question [${index + 1}]?",
        description: " Christian Religious Studies Description [${index + 1}]",
        images: [],
        options: [
          Option(
              id: 1, option: "Option 1 [${index + 1}]", isCorrectOption: false),
          Option(
              id: 2, option: "Option 2 [${index + 1}]", isCorrectOption: true),
          Option(
              id: 3, option: "Option 3 [${index + 1}]", isCorrectOption: false),
          Option(
              id: 4, option: "Option 4 [${index + 1}]", isCorrectOption: false),
        ],
        correctOption: 2,
      ),
    ),
    compulsory: false,
  ),
  Subject(
    name: 'Islamic Religious Studies',
    selected: false,
    examTypes: [ExamType.JAMB, ExamType.WAEC],
    questions: List.generate(
      50,
      (index) => Question(
        id: index + 1,
        question: " Islamic Religious Studies Question [${index + 1}]?",
        description: " Islamic Religious Studies Description [${index + 1}]",
        images: [],
        options: [
          Option(
              id: 1, option: "Option 1 [${index + 1}]", isCorrectOption: false),
          Option(
              id: 2, option: "Option 2 [${index + 1}]", isCorrectOption: true),
          Option(
              id: 3, option: "Option 3 [${index + 1}]", isCorrectOption: false),
          Option(
              id: 4, option: "Option 4 [${index + 1}]", isCorrectOption: false),
        ],
        correctOption: 2,
      ),
    ),
    compulsory: false,
  ),
  Subject(
    name: 'Commerce',
    selected: false,
    examTypes: [ExamType.JAMB, ExamType.WAEC],
    questions: List.generate(
      50,
      (index) => Question(
        id: index + 1,
        question: " Commerce Question [${index + 1}]?",
        description: " Commerce Description [${index + 1}]",
        images: [],
        options: [
          Option(
              id: 1, option: "Option 1 [${index + 1}]", isCorrectOption: false),
          Option(
              id: 2, option: "Option 2 [${index + 1}]", isCorrectOption: true),
          Option(
              id: 3, option: "Option 3 [${index + 1}]", isCorrectOption: false),
          Option(
              id: 4, option: "Option 4 [${index + 1}]", isCorrectOption: false),
        ],
        correctOption: 2,
      ),
    ),
    compulsory: false,
  ),
  Subject(
    name: 'History',
    selected: false,
    examTypes: [ExamType.JAMB, ExamType.WAEC],
    questions: List.generate(
      50,
      (index) => Question(
        id: index + 1,
        question: " History Question [${index + 1}]?",
        description: " History Description [${index + 1}]",
        images: [],
        options: [
          Option(
              id: 1, option: "Option 1 [${index + 1}]", isCorrectOption: false),
          Option(
              id: 2, option: "Option 2 [${index + 1}]", isCorrectOption: true),
          Option(
              id: 3, option: "Option 3 [${index + 1}]", isCorrectOption: false),
          Option(
              id: 4, option: "Option 4 [${index + 1}]", isCorrectOption: false),
        ],
        correctOption: 2,
      ),
    ),
    compulsory: false,
  ),
  Subject(
    name: 'Agricultural Science',
    selected: false,
    examTypes: [ExamType.JAMB, ExamType.WAEC],
    questions: List.generate(
      50,
      (index) => Question(
        id: index + 1,
        question: " Agricultural Science Question [${index + 1}]?",
        description: " Agricultural Science Description [${index + 1}]",
        images: [],
        options: [
          Option(
              id: 1, option: "Option 1 [${index + 1}]", isCorrectOption: false),
          Option(
              id: 2, option: "Option 2 [${index + 1}]", isCorrectOption: true),
          Option(
              id: 3, option: "Option 3 [${index + 1}]", isCorrectOption: false),
          Option(
              id: 4, option: "Option 4 [${index + 1}]", isCorrectOption: false),
        ],
        correctOption: 2,
      ),
    ),
    compulsory: false,
  ),
];

List<Question> englishQuestions = [
  Question(
    id: 1,
    question: "What is the plural of 'child'?",
    description: "",
    images: [],
    options: [
      Option(id: 1, option: "childs", isCorrectOption: false),
      Option(id: 2, option: "children", isCorrectOption: true),
      Option(id: 3, option: "childes", isCorrectOption: false),
      Option(id: 4, option: "child", isCorrectOption: false),
    ],
    correctOption: 2,
  ),
  Question(
    id: 2,
    question: "Which word means the opposite of 'happy'?",
    description: "",
    images: [],
    options: [
      Option(id: 1, option: "sad", isCorrectOption: true),
      Option(id: 2, option: "joyful", isCorrectOption: false),
      Option(id: 3, option: "excited", isCorrectOption: false),
      Option(id: 4, option: "content", isCorrectOption: false),
    ],
    correctOption: 1,
  ),
  Question(
    id: 3,
    question: "Choose the correct spelling:",
    description:
        "A. Acommodation B. Accommodation C. Acomodation D. Acomodation",
    images: [],
    options: [
      Option(id: 1, option: "Acommodation", isCorrectOption: false),
      Option(id: 2, option: "Accommodation", isCorrectOption: true),
      Option(id: 3, option: "Acomodation", isCorrectOption: false),
      Option(id: 4, option: "Acomodation", isCorrectOption: false),
    ],
    correctOption: 2,
  ),
  Question(
    id: 4,
    question: "Which word is a synonym for 'brave'?",
    description: "",
    images: [],
    options: [
      Option(id: 1, option: "fearful", isCorrectOption: false),
      Option(id: 2, option: "timid", isCorrectOption: false),
      Option(id: 3, option: "courageous", isCorrectOption: true),
      Option(id: 4, option: "scared", isCorrectOption: false),
    ],
    correctOption: 3,
  ),
  Question(
    id: 5,
    question: "Choose the correct sentence:",
    description: "A. He is taller than me. B. He is taller than I.",
    images: [],
    options: [
      Option(id: 1, option: "He is taller than me.", isCorrectOption: true),
      Option(id: 2, option: "He is taller than I.", isCorrectOption: false),
      Option(id: 3, option: "He is taller then me.", isCorrectOption: false),
      Option(id: 4, option: "He is taller then I.", isCorrectOption: false),
    ],
    correctOption: 1,
  ),
  Question(
    id: 6,
    question: "What is the past tense of 'go'?",
    description: "",
    images: [],
    options: [
      Option(id: 1, option: "goed", isCorrectOption: false),
      Option(id: 2, option: "went", isCorrectOption: true),
      Option(id: 3, option: "gone", isCorrectOption: false),
      Option(id: 4, option: "going", isCorrectOption: false),
    ],
    correctOption: 2,
  ),
  Question(
    id: 7,
    question: "Which word is a synonym for 'happy'?",
    description: "",
    images: [],
    options: [
      Option(id: 1, option: "sad", isCorrectOption: false),
      Option(id: 2, option: "joyful", isCorrectOption: true),
      Option(id: 3, option: "angry", isCorrectOption: false),
      Option(id: 4, option: "excited", isCorrectOption: false),
    ],
    correctOption: 2,
  ),
  Question(
    id: 8,
    question: "Choose the correct spelling:",
    description: "A. Neccessary B. Necesssary C. Necessary D. Necesary",
    images: [],
    options: [
      Option(id: 1, option: "Neccessary", isCorrectOption: false),
      Option(id: 2, option: "Necesssary", isCorrectOption: false),
      Option(id: 3, option: "Necessary", isCorrectOption: true),
      Option(id: 4, option: "Necesary", isCorrectOption: false),
    ],
    correctOption: 3,
  ),
  Question(
    id: 9,
    question: "Which word is an antonym for 'hard'?",
    description: "",
    images: [],
    options: [
      Option(id: 1, option: "easy", isCorrectOption: true),
      Option(id: 2, option: "difficult", isCorrectOption: false),
      Option(id: 3, option: "tough", isCorrectOption: false),
      Option(id: 4, option: "soft", isCorrectOption: false),
    ],
    correctOption: 1,
  ),
  Question(
    id: 10,
    question: "Choose the correct sentence:",
    description: "A. I will come if you will. B. I will come if you do.",
    images: [],
    options: [
      Option(id: 1, option: "I will come if you will.", isCorrectOption: false),
      Option(id: 2, option: "I will come if you do.", isCorrectOption: true),
      Option(id: 3, option: "I will come if you does.", isCorrectOption: false),
      Option(
          id: 4, option: "I will come if you don't.", isCorrectOption: false),
    ],
    correctOption: 2,
  ),
];

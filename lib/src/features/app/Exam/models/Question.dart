import 'Option.dart';

typedef Questions = List<Question>;

class Question {
  final int id;
  final String question;
  final String description;
  final List<String> images;
  final List<Option> options;
  final int correctOption;
  bool isAnswered;
  Question(
      {required this.id,
      required this.question,
      required this.description,
      required this.images,
      required this.options,
      required this.correctOption,
      this.isAnswered = false});

  bool isQuestionAnswered() {
    return isAnswered;
  }
}

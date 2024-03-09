

import 'Option.dart';

class Question {
  final int id;
  final String question;
  final String description;
  final List<String> images;
  final List<Option> options;

  Question(
      {required this.id,
        required this.question,
        required this.description,
        required this.images,
        required this.options});
}

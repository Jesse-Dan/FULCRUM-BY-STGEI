class Option {
  final int id;
  final String option;
  final bool isCorrectOption;
  bool chosen;

  Option(
      {required this.id,
      required this.option,
      required this.isCorrectOption,
      this.chosen = false});
}

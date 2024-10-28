import '../models/Question.dart';
import '../models/Subjects.dart';

abstract class ExamEvent {}


class InitExamEvent extends ExamEvent {}

class NextQuestionEvent extends ExamEvent {}

class PreviousQuestionEvent extends ExamEvent {}

class SubmitExamEvent extends ExamEvent {}

class SelectOptionEvent extends ExamEvent {
  final int optionIndex;

  SelectOptionEvent(this.optionIndex);
}

class ChangeSubjectEvent extends ExamEvent {
  final Subject? subject;

  ChangeSubjectEvent(this.subject);
}

class TrackQuestionEvent extends ExamEvent {
  final Question? question;

  TrackQuestionEvent(this.question);
}

class ToggleCalculatorEvent extends ExamEvent {}

class StartTimerEvent extends ExamEvent {}

class PauseTimerEvent extends ExamEvent {}

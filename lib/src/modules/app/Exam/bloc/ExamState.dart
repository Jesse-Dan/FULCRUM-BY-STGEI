// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:untitled/src/modules/app/Exam/models/ExamVariables.dart';

import '../models/Subjects.dart';

abstract class ExamState extends Equatable {
  const ExamState();

  @override
  List<Object> get props => [];
}

class ExamInitial extends ExamState {}

class ExamLoading extends ExamState {}

class ExamLoaded extends ExamState {
  late ExamVariables? examVariables;
  bool showCalculator;
  bool submitted;
  bool isSubmitting;

  ExamLoaded({
    this.examVariables,
    this.showCalculator = false,
    this.submitted = false,
    this.isSubmitting = false,
  });

  @override
  List<Object> get props => [];

  ExamLoaded copyWith({
    ExamVariables? examVariables,
    bool? showCalculator,
    bool? submitted,
    bool? isSubmitting,
  }) {
    return ExamLoaded(
      examVariables: examVariables ?? this.examVariables,
      showCalculator: showCalculator ?? this.showCalculator,
      submitted: submitted ?? this.submitted,
      isSubmitting: isSubmitting ?? this.isSubmitting,
    );
  }
}

class InitializeExamEvent extends ExamState {
  final List<Subject> offeringSubjects;
  final Duration remainingTime;

  const InitializeExamEvent(
      {required this.offeringSubjects, required this.remainingTime});

  @override
  List<Object> get props => [offeringSubjects, remainingTime];
}

class ExamError extends ExamState {
  final String error;

  const ExamError(this.error);

  @override
  List<Object> get props => [error];
}

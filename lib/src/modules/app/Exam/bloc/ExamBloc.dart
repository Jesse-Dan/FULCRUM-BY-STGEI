import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:untitled/src/reusable/enums/enums.dart';
import 'package:untitled/src/services/logger/logger.dart';

import '../../../../reusable/helpers/TimerController.dart';
import '../models/ExamVariables.dart';
import '../models/Question.dart';
import '../models/Subjects.dart';
import 'ExamEvent.dart';
import 'ExamState.dart';

class ExamBloc extends Bloc<ExamEvent, ExamState> {
  final TimerController _timerController = TimerController();

  late ExamVariables examVariables;

  ExamBloc() : super(ExamInitial()) {
    on<ExamEvent>((event, emit) async {
      if (event is ExamLoading) return;

      // emit(ExamLoading()); predefine where necccessary

      try {
        if (event is ChangeSubjectEvent) {
          _handleChangeSubject(state, emit, event.subject);
        } else if (event is TrackQuestionEvent) {
          _handleTrackQuestion(state, emit, event.question);
        } else if (event is SelectOptionEvent) {
          _handleSelectOption(state, emit, event.optionIndex);
        } else if (event is InitExamEvent) {
          _initExam(state, emit);
        }
        Logger.log(tag: Tag.BLOC_EVENT, message: state.toString());
      } catch (error) {
        Logger.log(tag: Tag.BLOC_EVENT, message: error.toString());
        emit(ExamError(error.toString()));
      }
    });
  }

  void _startTimer() {
    _timerController.start();
  }

  bool _canNavigate(ExamState state) =>
      state is ExamLoaded && !state.isSubmitting;

  @override
  Future<void> close() {
    _timerController.dispose();
    return super.close();
  }

  void _handleTrackQuestion(
      state, Emitter<ExamState> emit, Question? question) {
    examVariables.currentQuestion = question;
    emit(state);
  }

  void _initExam(state, Emitter<ExamState> emit) {
    emit(state);
  }

  void _handleChangeSubject(state, Emitter<ExamState> emit, Subject? subject) {
    examVariables.currentSubject = subject;
    examVariables.currentQuestion = subject?.questions[0];
    emit(state);
  }

  void _handleSelectOption(
      ExamState state, Emitter<ExamState> emit, int optionIndex) {
    final currentQuestionId = examVariables.currentQuestion?.id;
    final Map<int, int> newSelectedOptions =
        Map.from(examVariables.selectedOptions);

    // Check if the selected option is already the same as the currently selected option
    if (newSelectedOptions[currentQuestionId] == optionIndex) {
      // If it is, remove the selected option
      newSelectedOptions.remove(currentQuestionId);
    } else {
      // Otherwise, set the selected option
      newSelectedOptions[currentQuestionId!] = optionIndex;
    }
    emit(state);
  }
}

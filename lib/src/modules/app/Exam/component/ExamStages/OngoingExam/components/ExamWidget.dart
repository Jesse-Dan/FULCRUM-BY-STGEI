import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_navigator/go/go.dart';
import 'package:go_navigator/go/go_args.dart';
import 'package:untitled/src/modules/app/Exam/bloc/ExamBloc.dart';
import 'package:untitled/src/modules/app/Exam/component/ExamStages/OngoingExam/components/OptionsView.dart';
import 'package:untitled/src/reusable/enums/enums.dart';
import 'package:untitled/src/services/handler/handlers/loading_handler.dart';
import '../../../../../../../reusable/helpers/responsive.dart';
import '../../../../../../../reusable/styles/Colors.dart';
import '../../../../../../../reusable/styles/Dimentions.dart';
import '../../../../../Main/MainView.dart';
import '../../../Progress.dart';
import '../../SubmittedView.dart';
import 'ExamActionButton.dart';
import 'QuestionAndOptionWidget.dart';
import 'QuestionTracker.dart';

class ExamWidget extends StatefulWidget {
  const ExamWidget({
    super.key,
  });

  @override
  State<ExamWidget> createState() => _ExamWidgetState();
}

class _ExamWidgetState extends State<ExamWidget> {
  isTrainingMode(context) =>
      BlocProvider.of<ExamBloc>(context).examVariables.exam?.examMode ==
      ExamMode.Training;

  bool isSelected(int index) {
    final examBloc = context.watch<ExamBloc>();
    final currentQuestion = examBloc.examVariables.currentQuestion;

    if (currentQuestion != null) {
      final currentOptions = currentQuestion.options;
      if (index >= 0 && index < currentOptions.length) {
        return currentOptions[index].chosen;
      }
    }

    return false;
  }

  Color color(index, context) => isSelected(index)
      ? (isTrainingMode(context)
          ? (BlocProvider.of<ExamBloc>(context)
                  .examVariables
                  .currentQuestion!
                  .options[index]
                  .isCorrectOption
              ? Colors.green
              : Colors.red)
          : AppColors.kOtherPurple)
      : AppColors.kprimary600;

  IconData icon(index, context) => isSelected(index)
      ? (isTrainingMode(context)
          ? (BlocProvider.of<ExamBloc>(context)
                  .examVariables
                  .currentQuestion!
                  .options[index]
                  .isCorrectOption
              ? Icons.check
              : Icons.close)
          : Icons.check)
      : Icons.chrome_reader_mode_outlined;

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<ExamBloc>(context);
    return Container(
      margin: const EdgeInsets.all(AppDimentions.medium),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Exam is now in Session...',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.kOtherPurple,
                    fontSize: 30,
                    fontWeight: FontWeight.w600)),
            const SizedBox(height: AppDimentions.extraLarge),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  bloc.examVariables.selectedSubjects?.length ?? 0,
                  (i) => InkWell(
                    onTap: () {
                      bloc.examVariables.currentSubject =
                          bloc.examVariables.selectedSubjects?[i];
                      bloc.examVariables.currentQuestion =
                          bloc.examVariables.selectedSubjects?[i].questions[0];
                      setState(() {});
                    },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          color: (bloc.examVariables.currentSubject ==
                                  bloc.examVariables.selectedSubjects?[i])
                              ? AppColors.ksuccess
                              : AppColors.kprimary200),
                      margin:
                          const EdgeInsets.only(right: AppDimentions.medium),
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppDimentions.small),
                      child: Center(
                        child: Text(
                          bloc.examVariables.selectedSubjects?[i].name ??
                              'Error',
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppDimentions.extraLarge),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: AppDimentions.small),
              child: ProgressBar(
                  animationDuration:
                      bloc.examVariables.remainingTime?.inSeconds ??
                          const Duration(seconds: 0).inSeconds),
            ),
            const SizedBox(height: AppDimentions.extraLarge),
            Container(
              alignment: Alignment.center,
              color: Theme.of(context).scaffoldBackgroundColor,
              padding: const EdgeInsets.all(AppDimentions.large),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 40,
                      height: 40,
                      color: AppColors.kOtherPurple,
                      alignment: Alignment.center,
                      child: Text(
                        (bloc.examVariables.currentQuestion!.id).toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: AppDimentions.extraLarge),
                  QuestionAndOptionWidget(
                    questionAndOptionWidgetParams:
                        QuestionAndOptionWidgetParams(
                      questionDescription:
                          bloc.examVariables.currentQuestion?.description ?? '',
                      question: bloc.examVariables.currentQuestion?.question ??
                          'No Data',
                      optionsLength:
                          bloc.examVariables.currentQuestion?.options.length ??
                              0,
                    ),
                    optionWidget: Column(
                      children: List.generate(
                        bloc.examVariables.currentQuestion!.options.length,
                        (index) {
                          return OptionView(
                              optionViewParams: OptionViewParams(
                            index: index,
                            text: bloc.examVariables.currentQuestion!
                                .options[index].option,
                            press: () {
                              final currentQuestion =
                                  bloc.examVariables.currentQuestion;

                              if (currentQuestion != null) {
                                final currentOptions = currentQuestion.options;

                                if (index >= 0 &&
                                    index < currentOptions.length) {
                                  final selectedOption = currentOptions[index];
                                  final currentQuestionId = bloc
                                      .examVariables.selectedSubjects
                                      ?.indexWhere((element) =>
                                          element.questions.contains(bloc
                                              .examVariables.currentQuestion));

                                  // Update chosen status of options
                                  for (final option in currentOptions) {
                                    option.chosen = false;
                                  }
                                  selectedOption.chosen = true;

                                  bloc.examVariables.currentQuestion
                                      ?.isAnswered = true;

                                  // Update selected options in examBloc
                                  final newSelectedOptions = {
                                    currentQuestionId!: selectedOption.id
                                  };
                                  bloc.examVariables.selectedOptions =
                                      newSelectedOptions;

                                  // Notify UI to rebuild
                                  setState(() {});
                                }
                              }
                            },
                            color: color(index, context),
                            icon: icon(index, context),
                          ));
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: AppDimentions.extraLarge),

                  /// BUTTONS AND SELECTOR
                  Visibility(
                    visible: Responsive.isMobile(context),
                    child: Column(
                      children: [
                        ExamActionButtons(
                          examActionButtonsParams:
                              ExamActionButtonsParams(Previous: () {
                            final currentQuestionIndex = bloc
                                .examVariables.currentSubject!.questions
                                .indexOf(bloc.examVariables.currentQuestion!);
                            if (currentQuestionIndex >= 0) {
                              bloc.examVariables.currentQuestion = bloc
                                  .examVariables
                                  .currentSubject!
                                  .questions[currentQuestionIndex - 1];
                            }
                            setState(() {});
                          }, Next: () {
                            final currentQuestionIndex = bloc
                                .examVariables.currentSubject!.questions
                                .indexOf(bloc.examVariables.currentQuestion!);
                            final totalQuestions = bloc
                                .examVariables.currentSubject!.questions.length;
                            if (currentQuestionIndex < totalQuestions - 1) {
                              bloc.examVariables.currentQuestion = bloc
                                  .examVariables
                                  .currentSubject!
                                  .questions[currentQuestionIndex + 1];
                            }
                            setState(() {});
                          }, SubmitExam: () async {
                            LoadingHandler(context: context);
                            await Future.delayed(const Duration(seconds: 5));
                            Go(context).pop();
                            Go(context).to(
                                routeName: MainView.routeName,
                                args: GoArgs(args: [
                                  {'injectChild': const SubmittedView()}
                                ]));
                          }),
                        ),
                        const SizedBox(height: AppDimentions.medium),
                        QuestionTracker(
                          questionTrackerParams: QuestionTrackerParams(
                            currentSubject: bloc.examVariables.currentSubject!,
                            onTap: (index) {
                              bloc.examVariables.currentQuestion = bloc
                                  .examVariables
                                  .currentSubject
                                  ?.questions[index];
                              setState(() {});
                            },
                            questionAnswered: (index) =>
                                bloc.examVariables.currentQuestion?.isAnswered,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: !Responsive.isMobile(context),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ExamActionButtons(
                            examActionButtonsParams:
                                ExamActionButtonsParams(Previous: () {
                          final currentQuestionIndex = bloc
                              .examVariables.currentSubject!.questions
                              .indexOf(bloc.examVariables.currentQuestion!);
                          if (currentQuestionIndex >= 0) {
                            bloc.examVariables.currentQuestion = bloc
                                .examVariables
                                .currentSubject!
                                .questions[currentQuestionIndex - 1];
                          }
                          setState(() {});
                        }, Next: () {
                          final currentQuestionIndex = bloc
                              .examVariables.currentSubject!.questions
                              .indexOf(bloc.examVariables.currentQuestion!);
                          final totalQuestions = bloc
                              .examVariables.currentSubject!.questions.length;
                          if (currentQuestionIndex < totalQuestions - 1) {
                            bloc.examVariables.currentQuestion = bloc
                                .examVariables
                                .currentSubject!
                                .questions[currentQuestionIndex + 1];
                          }
                          setState(() {});
                        }, SubmitExam: () async {
                          LoadingHandler(context: context);
                          await Future.delayed(const Duration(seconds: 5));
                          Go(context).pop();
                          Go(context).to(
                              routeName: MainView.routeName,
                              args: GoArgs(args: [
                                {'injectChild': const SubmittedView()}
                              ]));
                        })),
                        const SizedBox(width: AppDimentions.medium),
                        Expanded(
                          child: QuestionTracker(
                            questionTrackerParams: QuestionTrackerParams(
                              currentSubject:
                                  bloc.examVariables.currentSubject!,
                              onTap: (index) {
                                bloc.examVariables.currentQuestion = bloc
                                    .examVariables
                                    .currentSubject
                                    ?.questions[index];
                                setState(() {});
                              },
                              questionAnswered: (index) => bloc
                                  .examVariables.currentQuestion?.isAnswered,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

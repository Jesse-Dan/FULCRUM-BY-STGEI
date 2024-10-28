import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_navigator/go/go.dart';
import 'package:go_navigator/go/go_args.dart';
import 'package:untitled/src/modules/app/Exam/component/ExamStages/ExamReady.dart';
import 'package:untitled/src/reusable/components/ArrowBackHeader.dart';
import 'package:untitled/src/reusable/components/app_button.dart';
import 'package:untitled/src/reusable/components/app_notifier.dart';
import 'package:untitled/src/services/logger/logger.dart';
import 'package:untitled/src/reusable/enums/enums.dart';
import '../../bloc/ExamBloc.dart';
import '../../models/Subjects.dart';
import '../../../../../reusable/helpers/responsive.dart';
import '../../../../../reusable/styles/Colors.dart';
import '../../../../../reusable/styles/Dimentions.dart';
import '../../../Main/MainView.dart';

class Jamb extends StatefulWidget {
  static const String routeName = '/Jamb';
  const Jamb({super.key});

  @override
  State<Jamb> createState() => _JambState();
}

class _JambState extends State<Jamb> {
  setQuestions(Subjects subjects, BuildContext context) {
    context.read<ExamBloc>().examVariables.selectedSubjects = subjects;
    context.read<ExamBloc>().examVariables.currentSubject =
        context.read<ExamBloc>().examVariables.selectedSubjects?[0];
    context.read<ExamBloc>().examVariables.currentQuestion = context
        .read<ExamBloc>()
        .examVariables
        .selectedSubjects?[0]
        .questions[0];
    Logger.log(
        tag: Tag.SERVICE_ACTION,
        message:
            context.read<ExamBloc>().examVariables.selectedSubjects.toString());
    Logger.log(
        tag: Tag.SERVICE_ACTION,
        message:
            'Subject Count ${context.read<ExamBloc>().examVariables.selectedSubjects?.length.toString()}');

    Logger.log(
        tag: Tag.SERVICE_ACTION,
        message:
            'Current Subject: ${context.read<ExamBloc>().examVariables.currentSubject}');

    /// SET CURRENT QUESTION
    Logger.log(
        tag: Tag.SERVICE_ACTION,
        message:
            'Current Question: ${context.read<ExamBloc>().examVariables.currentQuestion}');
  }

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<ExamBloc>();

    return Container(
      margin: const EdgeInsets.all(AppDimentions.medium),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ArrowBackHeader('Take an Exam - Jamb Simulator', context),
            const SizedBox(height: AppDimentions.extraLarge),
            Text(
                'Welcome to STGEI HUB Past Question Examination Center, where you will study past questions for you upcoming exam. To start studying past question right now, please select the subjects to be examined on. English Language is compulsory, so you are allowed to select 3 other subjects of your choice belo. after selection click next to enter exam Mode.',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.kprimary600,
                    fontSize: 14,
                    fontWeight: FontWeight.w400)),
            const SizedBox(height: AppDimentions.extraLarge),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.kprimary600)),
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                      vertical: AppDimentions.medium,
                      horizontal: AppDimentions.small),
                  shrinkWrap: true,
                  itemCount: bloc.examVariables.exam?.subjects.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
                      mainAxisSpacing: AppDimentions.medium,
                      crossAxisSpacing: AppDimentions.medium,
                      childAspectRatio: Responsive.isMobile(context)
                          ? AppDimentions.small - 5
                          : AppDimentions.small),
                  itemBuilder: (_, i) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                            value:
                                bloc.examVariables.exam?.subjects[i].selected,
                            onChanged: (value) {
                              setState(() {
                                bloc.examVariables.exam?.subjects[i].selected =
                                    value;
                              });
                            }),
                        Text(bloc.examVariables.exam!.subjects[i].name)
                      ],
                    );
                  }),
            ),
            const SizedBox(height: AppDimentions.extraLarge),
            SizedBox(
              height: 80,
              width: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppButton(
                    buttonType: ButtonType.SHORT_BTN,
                    applyInternalPadding: false,
                    flex: false,
                    btnText: 'Training',
                    onTap: () {
                      final selectedSubjectsCount = bloc
                              .examVariables.exam?.subjects
                              .where((element) => element
                                  .selected!) // Simplifies conditional expression
                              .length ??
                          0; // Handles potential null cases

                      final maxSubjects =
                          bloc.examVariables.exam?.subjectRange.$1 ??
                              4; // Provides default value
                      final minSubjects =
                          bloc.examVariables.exam?.subjectRange.$2 ??
                              3; // Provides default value

                      if (selectedSubjectsCount < minSubjects) {
                        AppNotifier.notifyAction(
                          context,
                          message:
                              'Please select at least $minSubjects subjects.',
                        );
                      } else if (selectedSubjectsCount > maxSubjects) {
                        AppNotifier.notifyAction(
                          context,
                          message:
                              'You can only select a maximum of $maxSubjects subjects.',
                        );
                      } else {
                        setQuestions(
                            bloc.examVariables.exam!.subjects
                                .where((element) => element.selected == true)
                                .toList(),
                            context);
                        bloc.examVariables.exam?.examMode = ExamMode.Training;

                        Go(context).to(
                            routeName: MainView.routeName,
                            args: GoArgs(args: [
                              {'injectChild': const ExamReady()}
                            ]));
                      }
                    },
                  ),
                  const SizedBox(
                    width: AppDimentions.medium,
                  ),
                  AppButton(
                      buttonType: ButtonType.SHORT_BTN,
                      applyInternalPadding: false,
                      flex: false,
                      btnText: 'Take Exam',
                      onTap: () {
                        final selectedSubjectsCount = bloc
                                .examVariables.exam?.subjects
                                .where((element) => element
                                    .selected!) // Simplifies conditional expression
                                .length ??
                            0; // Handles potential null cases

                        final maxSubjects =
                            bloc.examVariables.exam?.subjectRange.$1 ??
                                4; // Provides default value
                        final minSubjects =
                            bloc.examVariables.exam?.subjectRange.$2 ??
                                3; // Provides default value

                        if (selectedSubjectsCount < minSubjects) {
                          AppNotifier.notifyAction(
                            context,
                            message:
                                'Please select at least $minSubjects subjects.',
                          );
                        } else if (selectedSubjectsCount > maxSubjects) {
                          AppNotifier.notifyAction(
                            context,
                            message:
                                'You can only select a maximum of $maxSubjects subjects.',
                          );
                        } else {
                          setQuestions(
                              bloc.examVariables.exam!.subjects
                                  .where((element) => element.selected == true)
                                  .toList(),
                              context);
                          bloc.examVariables.exam?.examMode = ExamMode.Exam;

                          Go(context).to(
                              routeName: MainView.routeName,
                              args: GoArgs(args: [
                                {'injectChild': const ExamReady()}
                              ]));
                        }
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

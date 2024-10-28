import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_navigator/go/go.dart';
import 'package:untitled/src/modules/app/Exam/bloc/ExamBloc.dart';
import 'package:untitled/src/modules/app/Exam/component/ExamStages/OngoingExam/OngoingExam.dart';
import 'package:untitled/src/reusable/components/ArrowBackHeader.dart';
import 'package:untitled/src/reusable/components/app_button.dart';
import 'package:untitled/src/reusable/enums/enums.dart';
import '../../../../../reusable/styles/Colors.dart';
import '../../../../../reusable/styles/Dimentions.dart';
import '../../bloc/ExamEvent.dart';

class ExamReady extends StatefulWidget {
  static const String routeName = '/ExamReady';

  const ExamReady({super.key});

  @override
  State<ExamReady> createState() => _ExamReadyState();
}

class _ExamReadyState extends State<ExamReady> {
  @override
  Widget build(BuildContext context) {
    var bloc = context.read<ExamBloc>();
    int totalQuestions = 0; // Initialize a variable to store the total

// Loop through selected subjects and accumulate question count
    bloc.examVariables.selectedSubjects?.forEach((subject) {
      totalQuestions += subject.questions.length;
    });
    return Container(
      margin: const EdgeInsets.all(AppDimentions.medium),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ArrowBackHeader('Examination Instructions - Read All', context),
            const SizedBox(height: AppDimentions.extraLarge),
            Text('''You Have Selected the following subjects:
  ${bloc.examVariables.selectedSubjects?[0].name}
  ${bloc.examVariables.selectedSubjects?[1].name}
  ${bloc.examVariables.selectedSubjects?[2].name}
  ${bloc.examVariables.selectedSubjects?[3].name}''',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.kprimary600,
                    fontSize: 14,
                    fontWeight: FontWeight.w400)),
            const SizedBox(height: AppDimentions.extraLarge),

            /// PRACTICE MODE
            Text('${bloc.examVariables.exam?.examMode.name} Mode',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.kOtherPurple,
                    fontSize: 25,
                    fontWeight: FontWeight.w600)),
            const SizedBox(height: AppDimentions.extraLarge),
            Text('Total Number of Questions: $totalQuestions',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.kprimary600,
                    fontSize: 14,
                    fontWeight: FontWeight.w400)),
            Text(
                'Total Time Given: ${bloc.examVariables.remainingTime?.inMinutes} minutes',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.kprimary600,
                    fontSize: 14,
                    fontWeight: FontWeight.w400)),
            const SizedBox(height: AppDimentions.extraLarge),

            /// CBT INSTRUCTIONS
            Text('CBT Instructions',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.kOtherPurple,
                    fontSize: 25,
                    fontWeight: FontWeight.w600)),
            Text(
                bloc.examVariables.exam?.examMode == ExamMode.Training
                    ? bloc.examVariables.exam?.trainingInstructions ??
                        'No Instruction'
                    : bloc.examVariables.exam?.examInstructions ??
                        'No Instruction',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.kprimary600,
                    fontSize: 14,
                    fontWeight: FontWeight.w400)),
            const SizedBox(height: AppDimentions.extraLarge),

            /// Btns
            const SizedBox(height: AppDimentions.extraLarge),
            Align(
              alignment: Alignment.bottomRight,
              child: AppButton(
                buttonType: ButtonType.SHORT_BTN,
                applyInternalPadding: false,
                flex: false,
                btnText: 'Start Exam',
                btnColor: AppColors.ksecondary600,
                addBorder: true,
                borderColor: AppColors.kprimary600,
                btnTextColor: AppColors.kprimary600,
                onTap: () {
                  context.read<ExamBloc>().add(InitExamEvent());
                  Go(context).to(
                    routeName: OngoingExam.routeName,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_navigator/go/go.dart';
import 'package:go_navigator/go/go_args.dart';
import 'package:untitled/src/components/PopableHeader.dart';
import 'package:untitled/src/components/app_button.dart';
import 'package:untitled/src/enums/enums.dart';
import 'package:untitled/src/features/app/Exam/component/ExamStages/OngoingExam.dart';
import '../../models/Subjects.dart';
import '../../../../../styles/Colors.dart';
import '../../../../../styles/Dimentions.dart';
import '../../../Main/MainView.dart';

class ExamReady extends StatelessWidget {
  static const String routeName = '/ExamReady';

  final ExamMode examMode;
  final List<Subject> offeringSubjects;
  final String instructions;

  const ExamReady(
      {super.key,
      required this.examMode,
      required this.offeringSubjects,
      required this.instructions});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppDimentions.medium),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PopableHeader('Examination Instructions - Read All', context),
            const SizedBox(height: AppDimentions.extraLarge),
            Text('''You Have Selected the following subjects:
  ${offeringSubjects[0]}
  ${offeringSubjects[1]}
  ${offeringSubjects[2]}
  ${offeringSubjects[3]}''',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.kprimary600,
                    fontSize: 14,
                    fontWeight: FontWeight.w400)),
            const SizedBox(height: AppDimentions.extraLarge),

            /// PRACTICE MODE
            Text('Practice Mode',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.kOtherPurple,
                    fontSize: 25,
                    fontWeight: FontWeight.w600)),
            const SizedBox(height: AppDimentions.extraLarge),
            Text('Total Number of Questions: 50',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.kprimary600,
                    fontSize: 14,
                    fontWeight: FontWeight.w400)),
            Text('Total Time Given: 35 minutes',
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
                'You will be given 20 questions in english Language and 10 questions on each of the other subjects (a total of 50 questions). The questions will be presented 1 each in series starting with English language. Once you have answered a question you are required to click "Next" to move to the next question and "Finish" when you are done with all questions. if at anytime  you can nolonger continue, you can click on "Quit Exam" to see the performance analysis.\n\nYou will be given 35 minutes to answer all 50 questions and submit. if at any point youre unable to finish on time, you will be automatically shown the summary of your performance.\n\nKeep trying everytime, everyday and JAMB, WAEC, NECO, NABTEB exams will be a walk-over for you. To start now the "Start Exam" button below.',
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
                  Go(context).to(
                    routeName: OngoingExam.routeName,
                    args: GoArgs(
                      args: [
                        {'subjects': offeringSubjects}
                      ],
                    ),
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

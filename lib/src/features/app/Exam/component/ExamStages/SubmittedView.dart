import 'package:flutter/material.dart';
import 'package:go_navigator/go.dart';
import 'package:untitled/src/components/GenericDataTable.dart';
import 'package:untitled/src/features/app/Exam/component/ExamStages/ExplanationView.dart';
import 'package:untitled/src/features/app/Main/MainView.dart';
import 'package:untitled/src/helpers/responsive.dart';
import 'package:untitled/src/styles/Colors.dart';
import 'package:untitled/src/styles/Dimentions.dart';
import '../../../../../components/AppPieChart.dart';
import '../../../../../components/app_button.dart';
import '../../../../../components/submitted_table.dart';
import '../../../../../enums/enums.dart';

class SubmittedView extends StatefulWidget {
  const SubmittedView({super.key});

  @override
  State<SubmittedView> createState() => _SubmittedViewState();
}

class _SubmittedViewState extends State<SubmittedView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.kOtherPurple, width: 1.0)),
      margin: const EdgeInsets.symmetric(
          horizontal: AppDimentions.medium, vertical: AppDimentions.small),
      padding: const EdgeInsets.symmetric(
          horizontal: AppDimentions.small - 6,
          vertical: AppDimentions.small - 6),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: !Responsive.isMobile(context)
                          ? const Border(
                              right: BorderSide(
                                  color: AppColors.kOtherPurple, width: 2))
                          : const Border(
                              bottom: BorderSide(
                                  color: AppColors.kOtherPurple, width: 2))),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppDimentions.extraLarge,
                            vertical: AppDimentions.medium),
                        decoration:
                            const BoxDecoration(color: AppColors.kOtherPurple),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Your Score is: 40%',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white)),
                            Text('Your Jamb score is: 0',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white)),
                            Text('Time Spent: 00:00:27',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white)),
                          ],
                        ),
                      ),
                      const SizedBox(height: AppDimentions.large),
                      const GenericDataTable<String>(
                        headers: [
                          'Exam Variable',
                          'Value',
                        ],
                        rows: [
                          ['Total Questions', '50'],
                          ['Total Attempted Questions', '50'],
                          ['Total Correct', '50'],
                          ['Total Wrong', '50'],
                          ['Total Skipped', '50'],
                        ],
                      )
                    ],
                  ),
                ),
                Visibility(
                  visible: !Responsive.isMobile(context),
                  child: const Expanded(
                    child: AppPieChart(
                      dataMap: {
                        "Wrong": 20.5,
                        "Right": 70.5,
                      },
                      colorList: [
                        AppColors.kerror,
                        AppColors.ksuccess,
                      ],
                    ),
                  ),
                )
              ],
            ),
            Visibility(
                visible: Responsive.isMobile(context),
                child: const SizedBox(
                  height: AppDimentions.medium,
                )),
            Visibility(
              visible: Responsive.isMobile(context),
              child: const AppPieChart(
                dataMap: {
                  "Wrong": 20.5,
                  "Right": 70.5,
                },
                colorList: [
                  AppColors.kerror,
                  AppColors.ksuccess,
                ],
              ),
            ),
            Visibility(
                visible: !Responsive.isMobile(context),
                child: const SizedBox(
                  height: AppDimentions.large,
                )),
            Visibility(
                visible: Responsive.isMobile(context),
                child: const SizedBox(
                  height: AppDimentions.medium,
                )),
            const SubmittedTable(
              subjects: [
                'English Language',
                'Islamic Religious Knowledge',
                'Sweet Sixteen',
                'Music',
              ],
              totalQuestions: [20, 20, 20, 20],
              attemptedQuestions: [0, 0, 0, 0],
              skippedQuestions: [20, 20, 20, 20],
              correctQuestions: [0, 0, 0, 0],
              wrongQuestions: [20, 20, 20, 20],
            ),
            const SizedBox(
              height: AppDimentions.medium,
            ),
            Visibility(
                visible: Responsive.isMobile(context),
                child: const SubmitedActionButton()),
            Visibility(
              visible: !Responsive.isMobile(context),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppButton(
                    buttonType: ButtonType.LONG_BTN,
                    applyInternalPadding: true,
                    btnText: 'View Explanations',
                    onTap: () {
                      Go(context).to(
                          routeName: MainView.routeName,
                          args: GoArgs(args: [
                            {'injectChild': const ExplanationView()}
                          ]));
                    },
                  ),
                  const SizedBox(width: AppDimentions.medium),
                  AppButton(
                    buttonType: ButtonType.LONG_BTN,
                    applyInternalPadding: true,
                    btnText: 'Share Result',
                    onTap: () {},
                  ),
                  const SizedBox(width: AppDimentions.medium),
                  AppButton(
                    buttonType: ButtonType.LONG_BTN,
                    applyInternalPadding: true,
                    btnText: 'Proceed to Hub',
                    onTap: () {},
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SubmitedActionButton extends StatelessWidget {
  const SubmitedActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// NEXT BUTTONS
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppButton(
              buttonType: Responsive.isMobile(context)
                  ? ButtonType.LONG_BTN
                  : ButtonType.SHORT_BTN,
              applyInternalPadding: false,
              flex: Responsive.isMobile(context),
              btnText: 'View Explanations',
              onTap: () {
                Go(context).to(
                    routeName: MainView.routeName,
                    args: GoArgs(args: [
                      {'injectChild': const ExplanationView()}
                    ]));
              },
            ),
            const SizedBox(width: AppDimentions.medium),
            AppButton(
              buttonType: Responsive.isMobile(context)
                  ? ButtonType.LONG_BTN
                  : ButtonType.SHORT_BTN,
              applyInternalPadding: false,
              flex: Responsive.isMobile(context),
              btnText: 'Share Result',
              onTap: () {},
            )
          ],
        ),
        const SizedBox(height: AppDimentions.medium),
        AppButton(
          height: 80,
          width: 215,
          buttonType: Responsive.isMobile(context)
              ? ButtonType.LONG_BTN
              : ButtonType.SHORT_BTN,
          applyInternalPadding: false,
          flex: Responsive.isMobile(context),
          btnText: 'Proceed to Hub',
          onTap: () {},
        ),
      ],
    );
  }
}

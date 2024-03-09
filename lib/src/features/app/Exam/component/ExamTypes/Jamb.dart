import 'package:flutter/material.dart';
import 'package:go_navigator/go/go.dart';
import 'package:go_navigator/go/go_args.dart';
import 'package:untitled/src/components/app_button.dart';
import 'package:untitled/src/enums/enums.dart';
import 'package:untitled/src/features/app/Exam/component/ExamStages/ExamReady.dart';
import '../../models/Subjects.dart';
import '../../../../../components/PopableHeader.dart';
import '../../../../../helpers/responsive.dart';
import '../../../../../styles/Colors.dart';
import '../../../../../styles/Dimentions.dart';
import '../../../Main/MainView.dart';

class Jamb extends StatelessWidget {
  static const String routeName = '/Jamb';
  const Jamb({super.key});

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
            PopableHeader('Take an Exam - Jamb Simulator', context),
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
                  itemCount: 40,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
                      mainAxisSpacing: AppDimentions.medium,
                      crossAxisSpacing: AppDimentions.medium,
                      childAspectRatio: Responsive.isMobile(context)
                          ? AppDimentions.small - 5
                          : AppDimentions.small),
                  itemBuilder: (_, i) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(value: false, onChanged: (value) {}),
                        const Text('English Language')
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
                      Go(context).to(
                          routeName: Main.routeName,
                          args: GoArgs(args: [
                            {
                              'injectChild': const ExamReady(
                                examMode: ExamMode.Practice,
                                offeringSubjects: [],
                                instructions: '',
                              )
                            }
                          ]));
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
                      Go(context).to(
                          routeName: Main.routeName,
                          args: GoArgs(args: [
                            {
                              'injectChild': ExamReady(
                                examMode: ExamMode.Exam,
                                offeringSubjects: [
                                  Subject(
                                      name: 'English Language',
                                      compulsary: true,
                                      examtypes: [
                                        ExamType.JAMB,
                                        ExamType.WAEC,
                                        ExamType.OTHERS
                                      ], questions: []),
                                  Subject(
                                      name: 'Physics',
                                      compulsary: false,
                                      examtypes: [
                                        ExamType.JAMB,
                                        ExamType.WAEC
                                      ], questions: []),
                                  Subject(
                                      name: 'Chemistry',
                                      compulsary: false,
                                      examtypes: [
                                        ExamType.JAMB,
                                        ExamType.WAEC
                                      ], questions: []),
                                  Subject(
                                      name: 'Biology',
                                      compulsary: false,
                                      examtypes: [
                                        ExamType.JAMB,
                                        ExamType.WAEC
                                      ], questions: []),
                                ],
                                instructions: '',
                              )
                            }
                          ]));
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

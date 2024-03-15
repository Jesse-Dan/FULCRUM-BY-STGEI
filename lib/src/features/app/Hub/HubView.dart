import 'package:flutter/material.dart';
import 'package:go_navigator/go/go.dart';
import 'package:go_navigator/go/go_args.dart';
import 'package:untitled/src/models/User.dart';
import 'package:untitled/src/components/app_dialogue.dart';
import 'package:untitled/src/components/app_notifier.dart';
import '../../../enums/enums.dart';
import 'package:untitled/src/features/app/Exam/Exam.dart';
import '../../../components/BoardCard/Components/BoardCardWidget.dart';
import '../../../components/BoardCard/Model/BoardCardModel.dart';
import '../../../helpers/responsive.dart';
import '../../../styles/Colors.dart';
import '../../../styles/Dimentions.dart';
import '../Exam/models/Exam.dart';
import '../Exam/models/Syllabus.dart';
import '../Main/MainView.dart';

class HubView extends StatefulWidget {
  const HubView({super.key});

  @override
  State<HubView> createState() => _HubViewState();
}

class _HubViewState extends State<HubView> {

  List<BoardCardModel> hubCardsList(context) => [
        BoardCardModel(
          title: 'Buy Activation Code',
          description: 'Get An Activation Code for your account',
          voidCallback: () {},
          iconData: Icons.shopping_cart_sharp,
        ),
        BoardCardModel(
          title: 'CBT Practice',
          description:
              'Access over 208,000 past questions and their solutions\nfor JAMB, WAEC, NECO and NABTEB exams',
          voidCallback: () {
            showAdaptiveDialog(
                context: context,
                builder: (ctx) {
                  return StatefulBuilder(builder: (context, useState) {
                    return AppDialogue(
                        title: 'Choose a Simulator',
                        handlerBtnCount: HandlerBtnCount.two,
                        callBackTextOne: 'cancel',
                        callBackTextTwo: 'proceed',
                        callBackTwo: () {
                          Exam? exam = exams
                              .where((element) => element.selected == true)
                              .toList()
                              .firstOrNull;
                          if (exam == null) {
                            AppNotifier.notifyAction(context,
                                message: 'Select A Simulator to proceed');
                          } else {
                            Go(context).to(
                                routeName: Main.routeName,
                                args: GoArgs(args: [
                                  {
                                    'injectChild': ExamView(
                                      exam: exam,
                                    )
                                  }
                                ]));
                          }
                        },
                        callBackTextOneColor: Colors.white,
                        callBackTextTwoColor: Colors.white,
                        titleColor: Colors.white,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            exams.length,
                            (i) => ExamCard(exams[i], context: context,
                                onTap: () {
                              useState(() {
                                exams.forEach((element) {
                                  element.selected = false;
                                });
                                exams[i].selected = true;
                              });
                            }),
                          ),
                        ));
                  });
                });
          },
          iconData: Icons.timer_sharp,
        ),
        BoardCardModel(
          title: 'Accuracy Mode',
          description: 'See how accurate you are in answering questions.',
          voidCallback: () {},
          iconData: Icons.align_horizontal_right,
        ),
        BoardCardModel(
          title: 'Speed Mode',
          description: 'Learn to be particular about you answers.',
          voidCallback: () {},
          iconData: Icons.air_sharp,
        ),
      ];

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
            Text('Welcome ${user.firstName} ${user.lastName}',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.kprimary600,
                    fontSize: 30,
                    fontWeight: FontWeight.w600)),
            const SizedBox(height: AppDimentions.extraLarge),
            GridView.builder(
                shrinkWrap: true,
                itemCount: hubCardsList(context).length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: Responsive.isMobile(context) ? 1 : 2,
                    mainAxisSpacing: AppDimentions.medium,
                    crossAxisSpacing: AppDimentions.medium,
                    childAspectRatio: AppDimentions.small - 8),
                itemBuilder: (_, i) {
                  return BoardCardWidget(context,
                      BoardCardModel: hubCardsList(context)[i]);
                }),
          ],
        ),
      ),
    );
  }
}

ExamCard(Exam examType,
        {required BuildContext context, void Function()? onTap}) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: AppDimentions.small),
        padding: const EdgeInsets.symmetric(horizontal: AppDimentions.small),
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: examType.selected
                ? Colors.white
                : AppColors.kOtherPurple.withOpacity(.3)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              examType.name,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: examType.selected ? Colors.black : Colors.white),
              textAlign: TextAlign.left,
            ),
            Text(
              examType.description,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: examType.selected ? Colors.black : Colors.white),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );

import 'package:flutter/material.dart';
import 'package:go_navigator/go/go.dart';
import 'package:untitled/src/modules/app/Main/MainView.dart';
import 'package:untitled/src/reusable/components/ArrowBackHeader.dart';
import 'package:untitled/src/reusable/components/app_dialogue.dart';
import 'package:untitled/src/reusable/enums/enums.dart';
import 'package:untitled/src/reusable/helpers/responsive.dart';
import 'package:untitled/src/reusable/styles/Colors.dart';
import 'package:untitled/src/reusable/styles/Dimentions.dart';

import '../../../../../reusable/components/app_button.dart';

class ExplanationView extends StatefulWidget {
  const ExplanationView({super.key});

  @override
  State<ExplanationView> createState() => _ExplanationViewState();
}

class _ExplanationViewState extends State<ExplanationView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ArrowBackHeader(
              'Explanation - Use Question Tracker to View Explanation',
              context),
          ListView.builder(
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (context, i) {
                return const ExplanationTracker();
              }),
          AppButton(
            buttonType: ButtonType.LONG_BTN,
            applyInternalPadding: true,
            btnText: 'Proceed to Hub',
            onTap: () {
              Go(context).to(routeName: MainView.routeName);
            },
          ),
        ],
      ),
    );
  }
}

class ExplanationTracker extends StatefulWidget {
  const ExplanationTracker({
    super.key,
  });

  @override
  State<ExplanationTracker> createState() => _ExplanationTrackerState();
}

class _ExplanationTrackerState extends State<ExplanationTracker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      padding: const EdgeInsets.all(AppDimentions.small - 5),
      height: Responsive.isMobile(context) ? null : 125,
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'English Language',
            style: TextStyle(
              fontFamily: 'Satoshi',
              color: AppColors.kprimary600,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.36,
            ),
          ),
          const SizedBox(
            height: AppDimentions.medium,
          ),
          GridView(
            physics: Responsive.isMobile(context)
                ? const NeverScrollableScrollPhysics()
                : const BouncingScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: Responsive.isMobile(context) ? 5 : 20,
              mainAxisExtent: 50,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              childAspectRatio: 0.1,
            ),
            children: List.generate(
              20,
              (index) {
                return InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (_) {
                          return AppDialogue(
                            title: 'Explanation',
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '1. Choose the option that best conveys the meaning of the underlined portion in the following sentence;',
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                ),
                                Text(
                                  'Only the small fry get punished for such social misdemeanors',
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                ),
                                Text(
                                  '\n\nA. small boys',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                ),
                                Text(
                                  'B. unimportant people',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                ),
                                Text(
                                  'C. frightened people',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                ),
                                Text(
                                  'D. frivolous people',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                ),
                                Text(
                                  'E. inexperienced people',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                ),
                                Text(
                                  '\n\nTime Spent: 00:00:00',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                ),
                                Text(
                                  'Correct Answer: B',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                ),
                                Text(
                                  '\n\nSmall Fry is a term used to describe an insignificant person. It means insignificant people or things.',
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                )
                              ],
                            ),
                          );
                        });
                  },
                  child: Container(
                    width: 50,
                    color: AppColors.kOtherPurple,
                    alignment: Alignment.center,
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

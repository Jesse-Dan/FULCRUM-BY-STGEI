import 'package:flutter/material.dart';
import 'package:go_navigator/go/go.dart';
import 'package:untitled/src/components/ArrowBackHeader.dart';
import 'package:untitled/src/components/GenericDataTable.dart';
import 'package:untitled/src/features/app/Exam/component/ExamStages/OngoingExam/components/QuestionTracker.dart';
import 'package:untitled/src/features/app/Main/MainView.dart';
import 'package:untitled/src/helpers/responsive.dart';
import 'package:untitled/src/styles/Colors.dart';
import 'package:untitled/src/styles/Dimentions.dart';
import '../../../../../components/AppPieChart.dart';
import '../../../../../components/app_button.dart';
import '../../../../../components/submitted_table.dart';
import '../../../../../enums/enums.dart';

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
              Go(context).to(routeName: Main.routeName);
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
                          return const Padding(
                            padding: EdgeInsets.all(AppDimentions.medium),
                            child: Column(
                              children: [],
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

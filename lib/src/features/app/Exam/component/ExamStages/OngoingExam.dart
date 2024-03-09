import 'package:flutter/material.dart';
import 'package:untitled/src/features/app/Exam/component/ExamStages/ExamReady.dart';
import 'package:untitled/src/features/app/Exam/component/Progress.dart';
import 'package:untitled/src/helpers/responsive.dart';
import 'package:untitled/src/styles/Assets.dart';
import '../../models/Subjects.dart';
import '../../../../../components/PopableHeader.dart';
import '../../../../../components/app_button.dart';
import '../../../../../enums/enums.dart';
import '../../../../../helpers/ImageViewer.dart';
import '../../../../../styles/Colors.dart';
import '../../../../../styles/Dimentions.dart';

class OngoingExam extends StatefulWidget {
  static const String routeName = '/OngoingExam';

  List<Subject>? subjects;

  OngoingExam({super.key, required this.subjects});

  @override
  State<OngoingExam> createState() => _OngoingExamState();
}

class _OngoingExamState extends State<OngoingExam> {
  Subject? selectedValue;
  @override
  void initState() {
    if (widget.subjects!.isNotEmpty) {
      setState(() {
        selectedValue = widget.subjects?[0];
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      floatingActionButton: InkWell(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.all(
                    Responsive.isMobile(context) ? 8 : AppDimentions.medium),
                color: AppColors.kOtherPurple,
                child: Icon(
                  Icons.calculate_sharp,
                  size: Responsive.isMobile(context) ? 15 : 30,
                )),
            SizedBox(
                width: Responsive.isMobile(context) ? 8 : AppDimentions.small),
            Container(
                padding: EdgeInsets.all(
                    Responsive.isMobile(context) ? 8 : AppDimentions.medium),
                color: AppColors.kOtherPurple,
                child: Icon(
                  Icons.support_agent_sharp,
                  size: Responsive.isMobile(context) ? 15 : 30,
                )),
            SizedBox(
                width: Responsive.isMobile(context) ? 8 : AppDimentions.small),
            Container(
                padding: EdgeInsets.all(
                    Responsive.isMobile(context) ? 8 : AppDimentions.medium),
                color: AppColors.kOtherPurple,
                child: Icon(
                  Icons.info_outline_rounded,
                  size: Responsive.isMobile(context) ? 15 : 30,
                )),
          ],
        ),
      ),
      backgroundColor: AppColors.ksecondary600,
      body: Container(
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
                      widget.subjects!.length,
                      (index) => InkWell(
                            onTap: () {
                              selectedValue = widget.subjects?[index];
                              setState(() {});
                            },
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  color:
                                      widget.subjects?[index] == selectedValue
                                          ? AppColors.ksuccess
                                          : AppColors.kprimary200),
                              margin: const EdgeInsets.only(
                                  right: AppDimentions.medium),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppDimentions.small),
                              child: Center(
                                child: Text(
                                  widget.subjects![index].name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(
                                          color: widget.subjects?[index] ==
                                                  selectedValue
                                              ? AppColors.ksecondary600
                                              : null),
                                ),
                              ),
                            ),
                          )),
                ),
              ),
              const SizedBox(height: AppDimentions.extraLarge),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: AppDimentions.small),
                child: ProgressBar(animationDuration: 3000),
              ),
              const SizedBox(height: AppDimentions.extraLarge),
              const ExamQuestionWidget()
            ],
          ),
        ),
      ),
    );
  }
}

class QuestionAndOptionWidget extends StatelessWidget {
  const QuestionAndOptionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimentions.small),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Three forces with magnitudes 16 N, 12 N and 21 N are shown in the diagram below. Determine the magnitude of their resultant force and angle with the x-axis',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.black),
          ),
          const SizedBox(height: AppDimentions.medium / 2),
          Align(
            alignment: Responsive.isMobile(context)
                ? Alignment.center
                : Alignment.topLeft,
            child: const ImageViewer(
              imagePath: AppAssets.physicsImage,
              width: 200,
              height: 200,
              fit: BoxFit.cover, // Optional
              resizeMode: ImageResizeMode.contain, // Optional
            ),
          ),
          const SizedBox(height: AppDimentions.medium / 2),
          ...List.generate(
            ['', '', '', '', ''].length,
            (index) => Option(
              index: index,
              text: 'Option',
              press: () {},
              color: AppColors.kprimary600,
              icon: Icons.abc_sharp,
            ),
          ),
        ],
      ),
    );
  }
}

class ExamQuestionWidget extends StatelessWidget {
  const ExamQuestionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
              child: const Text(
                '1',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: AppDimentions.extraLarge),

          const QuestionAndOptionWidget(),

          const SizedBox(height: AppDimentions.extraLarge),

          /// BUTTONS AND SELECTOR
          ///
          Visibility(
            visible: Responsive.isMobile(context),
            child: const Column(
              children: [
                ExamActionButtons(),
                SizedBox(height: AppDimentions.medium),
                QuestionGrid()
              ],
            ),
          ),
          Visibility(
            visible: !Responsive.isMobile(context),
            child: const Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ExamActionButtons(),
                SizedBox(width: AppDimentions.medium),
                Expanded(child: QuestionGrid())
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class QuestionGrid extends StatelessWidget {
  const QuestionGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      padding: const EdgeInsets.all(AppDimentions.small - 5),
      height: Responsive.isMobile(context) ? null : 125,
      width: double.infinity,
      child: GridView(
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
          40,
          (index) => Container(
            width: 50,
            color: AppColors.kOtherPurple,
            alignment: Alignment.center,
            child: Text(
              '${index + 1}',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class ExamActionButtons extends StatelessWidget {
  const ExamActionButtons({
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
              btnText: 'Previous',
              onTap: () {},
            ),
            const SizedBox(width: AppDimentions.medium),
            AppButton(
              buttonType: Responsive.isMobile(context)
                  ? ButtonType.LONG_BTN
                  : ButtonType.SHORT_BTN,
              applyInternalPadding: false,
              flex: Responsive.isMobile(context),
              btnText: 'Next',
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
          btnText: 'Submit Exam',
          onTap: () {},
        ),
      ],
    );
  }
}

class Option extends StatelessWidget {
  const Option({
    Key? key,
    required this.text,
    required this.index,
    required this.press,
    required this.color,
    required this.icon,
  }) : super(key: key);

  final String text;
  final int index;
  final VoidCallback press;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        margin: const EdgeInsets.only(top: 8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${index + 1}. $text",
              style: const TextStyle(color: Colors.black45, fontSize: 16),
            ),
            Container(
              height: 26,
              width: 26,
              decoration: BoxDecoration(
                color: color == Colors.transparent ? Colors.transparent : color,
                borderRadius: BorderRadius.circular(2),
                border: Border.all(color: color),
              ),
              child: color == Colors.transparent ? null : Icon(icon, size: 16),
            )
          ],
        ),
      ),
    );
  }
}

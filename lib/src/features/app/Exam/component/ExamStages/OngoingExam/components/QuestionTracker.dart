import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/src/features/app/Exam/models/Subjects.dart';
import '../../../../../../../helpers/responsive.dart';
import '../../../../../../../styles/Colors.dart';
import '../../../../../../../styles/Dimentions.dart';
import '../../../../bloc/ExamBloc.dart';

class QuestionTrackerParams {
  final Subject currentSubject;
  final Function(int) onTap;
  final Function(int) questionAnswered;

  QuestionTrackerParams(
      {required this.currentSubject,
      required this.onTap,
      required this.questionAnswered});
}

class QuestionTracker extends StatefulWidget {
  final QuestionTrackerParams questionTrackerParams;
  const QuestionTracker({
    super.key,
    required this.questionTrackerParams,
  });

  @override
  State<QuestionTracker> createState() => _QuestionTrackerState();
}

class _QuestionTrackerState extends State<QuestionTracker> {
  @override
  Widget build(BuildContext context) {
    var bloc = context.read<ExamBloc>();

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
          widget.questionTrackerParams.currentSubject.questions.length,
              (index) {
            final questionAnswered =
            widget.questionTrackerParams.questionAnswered(index);
            return InkWell(
              onTap: () => widget.questionTrackerParams.onTap(index),
              child: Container(
                width: 50,
                color: questionAnswered
                    ? Colors.deepPurple
                    : AppColors.kOtherPurple,
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:untitled/src/reusable/components/app_button.dart';
import 'package:untitled/src/reusable/enums/enums.dart';
import '../../../../../../../reusable/helpers/responsive.dart';
import '../../../../../../../reusable/styles/Dimentions.dart';

class ExamActionButtonsParams {
  final void Function()? Previous;
  final void Function()? Next;
  final void Function()? SubmitExam;

  ExamActionButtonsParams(
      {required this.Previous, required this.Next, required this.SubmitExam});
}

class ExamActionButtons extends StatelessWidget {
  final ExamActionButtonsParams examActionButtonsParams;
  const ExamActionButtons({
    super.key,
    required this.examActionButtonsParams,
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
              onTap: examActionButtonsParams.Previous,
            ),
            const SizedBox(width: AppDimentions.medium),
            AppButton(
              buttonType: Responsive.isMobile(context)
                  ? ButtonType.LONG_BTN
                  : ButtonType.SHORT_BTN,
              applyInternalPadding: false,
              flex: Responsive.isMobile(context),
              btnText: 'Next',
              onTap: examActionButtonsParams.Next,
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
          onTap: examActionButtonsParams.SubmitExam,
        ),
      ],
    );
  }
}

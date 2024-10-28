import 'package:flutter/material.dart';
import 'package:untitled/src/reusable/enums/enums.dart';import '../../../../../../../reusable/helpers/ImageViewer.dart';
import '../../../../../../../reusable/helpers/responsive.dart';
import '../../../../../../../reusable/styles/Assets.dart';
import '../../../../../../../reusable/styles/Dimentions.dart';

class QuestionAndOptionWidgetParams {
  final String question;
  final String questionDescription;
  final int optionsLength;

  QuestionAndOptionWidgetParams({
    required this.question,
    required this.optionsLength,
    required this.questionDescription,
  });
}

class QuestionAndOptionWidget extends StatefulWidget {
  final QuestionAndOptionWidgetParams questionAndOptionWidgetParams;
  final Widget optionWidget;
  const QuestionAndOptionWidget({
    super.key,
    required this.questionAndOptionWidgetParams,
    required this.optionWidget,
  });

  @override
  State<QuestionAndOptionWidget> createState() =>
      _QuestionAndOptionWidgetState();
}

class _QuestionAndOptionWidgetState extends State<QuestionAndOptionWidget> {
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
            widget.questionAndOptionWidgetParams.question,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.black),
          ),
          const SizedBox(height: AppDimentions.medium / 2),
          Text(
            widget.questionAndOptionWidgetParams.questionDescription,
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
          widget.optionWidget,
        ],
      ),
    );
  }
}

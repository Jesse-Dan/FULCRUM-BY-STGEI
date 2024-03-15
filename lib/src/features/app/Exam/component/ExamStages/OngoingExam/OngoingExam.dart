import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_navigator/go.dart';
import 'package:untitled/src/core/handler/handlers/loading_handler.dart';
import 'package:untitled/src/core/logger/logger.dart';
import 'package:untitled/src/enums/enums.dart';
import 'package:untitled/src/features/app/Exam/bloc/ExamEvent.dart';
import 'package:untitled/src/features/app/Exam/component/Progress.dart';
import 'package:untitled/src/helpers/responsive.dart';
import '../../../bloc/ExamBloc.dart';
import '../../../bloc/ExamState.dart';
import '../../../../../../styles/Colors.dart';
import '../../../../../../styles/Dimentions.dart';
import 'components/ExamWidget.dart';

class OngoingExam extends StatefulWidget {
  static const String routeName = '/OngoingExam';

  const OngoingExam({
    super.key,
  });

  @override
  State<OngoingExam> createState() => _OngoingExamState();
}

class _OngoingExamState extends State<OngoingExam> {
  @override
  Widget build(BuildContext context) {
    var bloc = context.read<ExamBloc>();

    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                  padding: EdgeInsets.all(
                      Responsive.isMobile(context) ? 8 : AppDimentions.medium),
                  color: AppColors.kOtherPurple,
                  child: Icon(
                    Icons.calculate_sharp,
                    size: Responsive.isMobile(context) ? 15 : 30,
                  )),
            ),
            SizedBox(
                width: Responsive.isMobile(context) ? 8 : AppDimentions.small),
            InkWell(
              onTap: () {},
              child: Container(
                  padding: EdgeInsets.all(
                      Responsive.isMobile(context) ? 8 : AppDimentions.medium),
                  color: AppColors.kOtherPurple,
                  child: Icon(
                    Icons.support_agent_sharp,
                    size: Responsive.isMobile(context) ? 15 : 30,
                  )),
            ),
            SizedBox(
                width: Responsive.isMobile(context) ? 8 : AppDimentions.small),
            InkWell(
              onTap: () {},
              child: Container(
                  padding: EdgeInsets.all(
                      Responsive.isMobile(context) ? 8 : AppDimentions.medium),
                  color: AppColors.kOtherPurple,
                  child: Icon(
                    Icons.info_outline_rounded,
                    size: Responsive.isMobile(context) ? 15 : 30,
                  )),
            ),
          ],
        ),
        backgroundColor: AppColors.ksecondary600,
        body: const ExamWidget());
  }
}

import 'package:flutter/material.dart';
import 'package:untitled/src/reusable/helpers/responsive.dart';

import '../../../../../../reusable/styles/Colors.dart';
import '../../../../../../reusable/styles/Dimentions.dart';
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

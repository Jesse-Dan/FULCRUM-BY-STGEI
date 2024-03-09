import 'package:flutter/material.dart';
import 'package:untitled/src/features/app/ErrorView.dart';
import 'package:untitled/src/features/app/Exam/component/ExamTypes/Custom.dart';
import 'package:untitled/src/features/app/Exam/component/ExamTypes/Waec.dart';
import 'package:untitled/src/features/app/Hub/models/ExamType.dart';

import '../../../enums/enums.dart';
import '../../../styles/Dimentions.dart';
import 'component/ExamTypes/Jamb.dart';
import 'models/Exam.dart';

class ExamView extends StatelessWidget {
  static const String routeName = '/Exam';
  final Exam? exam;
  const ExamView({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    return switch (exam?.examType) {
      ExamType.JAMB => const Jamb(),
      ExamType.WAEC => const Waec(),
      ExamType.OTHERS => const Waec(),
      _ => const ErrorView(errorMsg: 'Invalid Input')
    };
  }
}

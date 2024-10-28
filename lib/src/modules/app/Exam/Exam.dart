import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/src/modules/app/ErrorView.dart';
import 'package:untitled/src/modules/app/Exam/bloc/ExamBloc.dart';
import 'package:untitled/src/modules/app/Exam/component/ExamTypes/Custom.dart';
import 'package:untitled/src/modules/app/Exam/component/ExamTypes/Waec.dart';
import 'package:untitled/src/modules/app/Exam/models/ExamVariables.dart';
import 'package:untitled/src/modules/app/Hub/models/ExamType.dart';

import '../../../reusable/enums/enums.dart';
import '../../../reusable/styles/Dimentions.dart';
import 'component/ExamTypes/Jamb.dart';
import 'models/Exam.dart';

class ExamView extends StatelessWidget {
  static const String routeName = '/Exam';
  final Exam? exam;
  const ExamView({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    /// read bloc from context
    var bloc = context.read<ExamBloc>();

    /// initialize exam variables
    bloc.examVariables = ExamVariables(exam: exam);

    /// switch to required view
    return switch (exam?.examType) {
      ExamType.JAMB => const Jamb(),
      ExamType.WAEC => const Waec(),
      ExamType.OTHERS => const Custom(),
      _ => const ErrorView(errorMsg: 'Invalid Input')
    };
  }
}

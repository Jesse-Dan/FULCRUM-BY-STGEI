import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_navigator/go/go_navigator.dart';
import 'package:untitled/src/features/app/ErrorView.dart';
import 'package:untitled/src/features/app/Exam/Exam.dart';
import 'package:untitled/src/features/app/Exam/component/ExamStages/OngoingExam/OngoingExam.dart';
import 'package:untitled/src/features/auth/AuthView.dart';

import '../features/app/Main/MainView.dart';
import '../features/app/Search/SearchView.dart';

MaterialPageRoute goNavigator(RouteSettings routeSettings) {
  return GoNavigator(initialRoute: const AuthView(), routes: {
    AuthView.routeName: (context, args) => const AuthView(),
    MainView.routeName: (context, args) => MainView(
          newIndex: args?.args[0]['newIndex'],
          injectChild: args?.args[0]['injectChild'],
        ),
    SearchView.routeName: (context, args) => SearchView(),
    ExamView.routeName: (context, args) => ExamView(
          exam: args?.args[0]['exam'],
        ),
    ErrorView.routeName: (context, args) => ErrorView(
          errorMsg: args?.args[0]['errorMsg'],
        ),
    OngoingExam.routeName: (context, args) => const OngoingExam(),
  }).generateRoute(routeSettings);
}

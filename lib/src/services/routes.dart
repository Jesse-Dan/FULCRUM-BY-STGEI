import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_navigator/go/go_navigator.dart';
import 'package:untitled/src/modules/app/ErrorView.dart';
import 'package:untitled/src/modules/app/Exam/Exam.dart';
import 'package:untitled/src/modules/app/Exam/component/ExamStages/OngoingExam/OngoingExam.dart';
import 'package:untitled/src/modules/auth/AuthView.dart';

import '../modules/app/Main/MainView.dart';
import '../modules/app/Search/SearchView.dart';

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

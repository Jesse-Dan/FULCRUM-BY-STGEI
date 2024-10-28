import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_app_notification/in_app_notification.dart';
import 'package:untitled/src/services/routes.dart';
import 'package:untitled/src/reusable/styles/Theme/Dark.dart';

import '../reusable/styles/Theme/Light.dart';
import 'app/Exam/bloc/ExamBloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return InAppNotification(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (examBloc) => ExamBloc(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'STGEI HUB',
          themeMode: ThemeMode.system,
          theme: lightTheme,
          darkTheme: darkTheme,
          onGenerateRoute: (routeSettings) => goNavigator(routeSettings),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:in_app_notification/in_app_notification.dart';
import 'package:untitled/src/core/routes.dart';
import 'package:untitled/src/styles/Theme/Dark.dart';

import '../styles/Theme/Light.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return InAppNotification(child:  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'STGEI HUB',
      themeMode: ThemeMode.system,
      theme: lightTheme,
      darkTheme: darkTheme,
      onGenerateRoute: (routeSettings) => goNavigator(routeSettings),
    ));
  }
}

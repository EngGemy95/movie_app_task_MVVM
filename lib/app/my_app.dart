import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../presentation/resource_data/route_manager.dart';
import '../presentation/resource_data/theme_manager.dart';

class MyApp extends StatefulWidget {
  //const MyApp({Key? key}) : super(key: key);

  int appState = 0;

  //Named Constructor
  MyApp.internal();

  static final MyApp _instance = MyApp.internal();

  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) => RouteGenerator.getRoute(settings),
        theme: getApplicationTheme(),
      );
    });
  }
}

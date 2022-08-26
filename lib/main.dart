import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies_app/presentation/resource_data/color_manager.dart';

import 'app/di.dart';
import 'app/my_app.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: ColorManager.gradientBlue3, // for android
    statusBarIconBrightness: Brightness.light, // for android
    statusBarBrightness: Brightness.light, // for ios
  ));
  //add these lines for portrait only (to disable the landscape mode )
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  await initAppModule(); // this function for call dependency injection
  runApp(MyApp());
}

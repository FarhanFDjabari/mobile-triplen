import 'package:flutter/material.dart';
import 'package:triplen_app/screens/splash_screen.dart';
import 'package:triplen_app/utils/color_util.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: ColorUtil.primaryColor,
        primaryColorDark: ColorUtil.secondaryColor,
      ),
      home: SplashScreen(),
    );
  }
}

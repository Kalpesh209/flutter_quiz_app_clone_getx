import 'package:flutter/material.dart';
import 'package:flutter_quiz_app_clone/AppUtils/app_strings.dart';
import 'package:flutter_quiz_app_clone/Presenatation/Screens/Welcome/welcome_screen.dart';
import 'package:get/get.dart';

/*
Title: Entry Point of a App
Purpose:Entry Point of a App
Created On: 26/04/2024
Edited On:26/04/2024
Author: Kalpesh Khandla
*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: WelcomeScreen(),
    );
  }
}

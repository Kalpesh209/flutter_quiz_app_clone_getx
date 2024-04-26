import 'package:flutter/material.dart';
import 'package:flutter_quiz_app_clone/AppUtils/app_strings.dart';
import 'package:flutter_quiz_app_clone/Business/question_controller.dart';
import 'package:flutter_quiz_app_clone/Presenatation/Widgets/body_widget.dart';
import 'package:get/get.dart';

/*
Title: QuizScreen
Purpose:QuizScreen
Created On: 24/04/2024
Edited On:24/04/2024
Author: Kalpesh Khandla
*/

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: _controller.nextQuestion,
            child: Text(
              AppStrings.skip,
            ),
          ),
        ],
      ),
      body: BodyWidget(),
    );
  }
}

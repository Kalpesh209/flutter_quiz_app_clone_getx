import 'package:flutter/material.dart';
import 'package:flutter_quiz_app_clone/AppUtils/app_colors.dart';
import 'package:flutter_quiz_app_clone/AppUtils/app_font_size.dart';
import 'package:flutter_quiz_app_clone/AppUtils/app_font_weight.dart';
import 'package:flutter_quiz_app_clone/AppUtils/app_images.dart';
import 'package:flutter_quiz_app_clone/AppUtils/app_strings.dart';
import 'package:flutter_quiz_app_clone/Business/question_controller.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

/*
Title: ScoreScreen
Purpose:ScoreScreen
Created On: 24/04/2024
Edited On:24/04/2024
Author: Kalpesh Khandla
*/

class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset(
            AppImages.bgIcon,
            fit: BoxFit.fill,
          ),
          Column(
            children: [
              Spacer(flex: 3),
              Text(
                AppStrings.score,
                style: TextStyle(
                  color: AppColors.kSecondaryColor,
                  fontSize: AppFontSize.fontSize34,
                  fontWeight: AppFontWeight.fontWeight700,
                ),
              ),
              // Spacer(),
              Text(
                '${_qnController.correctAns! * 10}/${_qnController.questions.length * 10}',
                style: TextStyle(
                  color: AppColors.kSecondaryColor,
                  fontSize: AppFontSize.fontSize34,
                  fontWeight: AppFontWeight.fontWeight700,
                ),
              ),
              Spacer(flex: 3),
            ],
          )
        ],
      ),
    );
  }
}

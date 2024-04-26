import 'package:flutter/material.dart';
import 'package:flutter_quiz_app_clone/AppUtils/app_constants.dart';
import 'package:flutter_quiz_app_clone/Business/question_controller.dart';
import 'package:flutter_quiz_app_clone/Model/question_model.dart';
import 'package:flutter_quiz_app_clone/Presenatation/Widgets/option_widget.dart';
import 'package:get/get.dart';

class QuestionCardWidget extends StatelessWidget {
  final QuestionModel question;
  const QuestionCardWidget({
    Key? key,
    // it means we have to pass this
    required this.question,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppConstants.kDefaultPadding),
      padding: EdgeInsets.all(AppConstants.kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            question.question,
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(height: AppConstants.kDefaultPadding / 2),
          ...List.generate(
            question.options.length,
            (index) => OptionWidget(
              index: index,
              text: question.options[index],
              press: () => _controller.checkAns(question, index),
            ),
          ),
        ],
      ),
    );
  }
}

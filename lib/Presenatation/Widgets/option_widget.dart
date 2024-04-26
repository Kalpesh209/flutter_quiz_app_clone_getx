import 'package:flutter/material.dart';
import 'package:flutter_quiz_app_clone/AppUtils/app_colors.dart';
import 'package:flutter_quiz_app_clone/AppUtils/app_constants.dart';
import 'package:flutter_quiz_app_clone/Business/question_controller.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class OptionWidget extends StatelessWidget {
  const OptionWidget({
    Key? key,
    required this.text,
    required this.index,
    required this.press,
  }) : super(key: key);
  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (qnController) {
          Color getTheRightColor() {
            if (qnController.isAnswered) {
              if (index == qnController.correctAns) {
                return AppColors.kgreenColor;
              } else if (index == qnController.selectedAns &&
                  qnController.selectedAns != qnController.correctAns) {
                return AppColors.kredColor;
              }
            }
            return AppColors.kgreyColor;
          }

          IconData getTheRightIcon() {
            return getTheRightColor() == AppColors.kredColor
                ? Icons.close
                : Icons.done;
          }

          return InkWell(
            onTap: press,
            child: Container(
              margin: EdgeInsets.only(top: AppConstants.kDefaultPadding),
              padding: EdgeInsets.all(AppConstants.kDefaultPadding),
              decoration: BoxDecoration(
                border: Border.all(color: getTheRightColor()),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${index + 1}. $text",
                    style: TextStyle(color: getTheRightColor(), fontSize: 16),
                  ),
                  Container(
                    height: 26,
                    width: 26,
                    decoration: BoxDecoration(
                      color: getTheRightColor() == AppColors.kgreyColor
                          ? Colors.transparent
                          : getTheRightColor(),
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: getTheRightColor()),
                    ),
                    child: getTheRightColor() == AppColors.kgreyColor
                        ? null
                        : Icon(getTheRightIcon(), size: 16),
                  )
                ],
              ),
            ),
          );
        });
  }
}

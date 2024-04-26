import 'package:flutter/material.dart';
import 'package:flutter_quiz_app_clone/AppUtils/app_colors.dart';
import 'package:flutter_quiz_app_clone/AppUtils/app_constants.dart';
import 'package:flutter_quiz_app_clone/Business/question_controller.dart';
import 'package:flutter_quiz_app_clone/Presenatation/Widgets/progress_bar_widget.dart';
import 'package:flutter_quiz_app_clone/Presenatation/Widgets/question_card_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // So that we have acccess our controller
    QuestionController _questionController = Get.put(QuestionController());
    return Stack(
      children: [
        SvgPicture.asset(
          "assets/icons/bg.svg",
          fit: BoxFit.fill,
        ),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.kDefaultPadding),
                child: ProgressBarWidget(),
              ),
              SizedBox(height: AppConstants.kDefaultPadding),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.kDefaultPadding),
                child: Obx(
                  () => Text.rich(
                    TextSpan(
                      text:
                          "Question ${_questionController.questionNumber.value}",
                      style: TextStyle(
                        color: AppColors.kSecondaryColor,
                      ),
                      children: [
                        TextSpan(
                          text: "/${_questionController.questions.length}",
                          style: TextStyle(
                            color: AppColors.kSecondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(thickness: 1.5),
              SizedBox(height: AppConstants.kDefaultPadding),
              Expanded(
                child: PageView.builder(
                  // Block swipe to next qn
                  physics: NeverScrollableScrollPhysics(),
                  controller: _questionController.pageController,
                  onPageChanged: _questionController.updateTheQnNum,
                  itemCount: _questionController.questions.length,
                  itemBuilder: (context, index) => QuestionCardWidget(
                      question: _questionController.questions[index]),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

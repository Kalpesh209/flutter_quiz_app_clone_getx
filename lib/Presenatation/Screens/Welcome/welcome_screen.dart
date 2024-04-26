import 'package:flutter/material.dart';
import 'package:flutter_quiz_app_clone/AppUtils/app_colors.dart';
import 'package:flutter_quiz_app_clone/AppUtils/app_constants.dart';
import 'package:flutter_quiz_app_clone/AppUtils/app_images.dart';
import 'package:flutter_quiz_app_clone/AppUtils/app_strings.dart';
import 'package:flutter_quiz_app_clone/Presenatation/Screens/Quiz/quiz_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

/*
Title: WelcomeScreen
Purpose:WelcomeScreen
Created On: 24/04/2024
Edited On:24/04/2024
Author: Kalpesh Khandla
*/

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  TextEditingController nameController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            AppImages.bgIcon,
            fit: BoxFit.fill,
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppConstants.kDefaultPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(flex: 2), //2/6
                  Text(
                    AppStrings.letsPlay,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    AppStrings.enterYourInfo,
                  ),
                  Spacer(), // 1/6
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.color1C2341,
                      hintText: AppStrings.fullName,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                  ),
                  Spacer(), // 1/6
                  InkWell(
                    onTap: () {
                      if (nameController.text == '') {
                        const snackBar = SnackBar(
                          backgroundColor: AppColors.kSnackBarColor,
                          content: Text(
                            AppStrings.nameRequired,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else {
                        Get.to(QuizScreen());
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(
                        AppConstants.kDefaultPadding * 0.75,
                      ), // 15
                      decoration: BoxDecoration(
                        gradient: AppColors.kPrimaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Text(
                        AppStrings.letsStart,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  Spacer(flex: 2), // it will take 2/6 spaces
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

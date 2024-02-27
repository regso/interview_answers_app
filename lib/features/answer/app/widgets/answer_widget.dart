import 'package:flutter/material.dart';
import 'package:interview_answers_app/config/main_theme_colors.dart';
import 'package:interview_answers_app/features/answer/app/widgets/answer_icon.dart';
import 'package:interview_answers_app/features/answer/app/widgets/answer_text_widget.dart';
import 'package:interview_answers_app/features/answer/app/widgets/stars_widget.dart';

class AnswerWidget extends StatelessWidget {
  const AnswerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          AnswerIcon(),
          SizedBox(height: 30),
          Text(
            'What is the state of a widget?',
            style: TextStyle(
              color: MainThemeColors.mainText,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30),
          StarsWidget(),
          SizedBox(height: 50),
          AnswerTextWidget(),
        ],
      ),
    );
  }
}

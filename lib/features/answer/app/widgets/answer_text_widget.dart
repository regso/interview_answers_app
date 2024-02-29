import 'package:flutter/material.dart';
import 'package:interview_answers_app/config/labels.dart';
import 'package:interview_answers_app/config/main_theme_colors.dart';

class AnswerTextWidget extends StatelessWidget {
  final String answer;

  const AnswerTextWidget({super.key, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: MainThemeColors.secondaryBackground,
            width: 2,
          ),
        ),
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Text(
                Labels.answerAnswer,
                style: TextStyle(
                  color: MainThemeColors.mainText,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 10),
              Icon(
                Icons.keyboard_arrow_down_sharp,
                color: MainThemeColors.mainText,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            answer,
            style: const TextStyle(
              fontSize: 16,
              color: MainThemeColors.mainText,
            ),
          ),
        ],
      ),
    );
  }
}

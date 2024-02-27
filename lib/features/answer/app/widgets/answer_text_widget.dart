import 'package:flutter/material.dart';
import 'package:interview_answers_app/config/labels.dart';
import 'package:interview_answers_app/config/main_theme_colors.dart';

class AnswerTextWidget extends StatelessWidget {
  const AnswerTextWidget({super.key});

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
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                Labels.answersAnswer,
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
          SizedBox(height: 20),
          Text(
            'Create beautiful apps faster with Flutter’s collection of '
            'visual, structural, platform, and interactive widgets.',
            style: TextStyle(
              fontSize: 16,
              color: MainThemeColors.mainText,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:interview_answers_app/config/constants.dart';
import 'package:interview_answers_app/config/main_theme_colors.dart';

class AnswerIcon extends StatelessWidget {
  const AnswerIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: MainThemeColors.secondaryBackground,
        borderRadius: BorderRadius.all(
          Radius.circular(
            Constants.cardRadius,
          ),
        ),
      ),
      width: Constants.cardHeight,
      height: Constants.cardHeight,
      child: const Icon(
        Icons.question_mark_sharp,
        color: MainThemeColors.secondaryText,
        size: 46,
      ),
    );
  }
}

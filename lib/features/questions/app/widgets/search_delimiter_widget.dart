import 'package:flutter/material.dart';
import 'package:interview_answers_app/config/labels.dart';
import 'package:interview_answers_app/config/main_theme_colors.dart';

class SearchDelimiterWidget extends StatelessWidget {
  final int count;

  const SearchDelimiterWidget({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: MainThemeColors.secondaryBackground,
            width: 1,
          ),
        ),
      ),
      child: Text(
        '${Labels.questionsQuestionsFound}: $count',
        style: const TextStyle(
          color: MainThemeColors.mainText,
        ),
      ),
    );
  }
}

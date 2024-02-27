import 'package:flutter/material.dart';
import 'package:interview_answers_app/config/labels.dart';
import 'package:interview_answers_app/config/main_theme_colors.dart';

class SearchDelimiterWidget extends StatelessWidget {
  const SearchDelimiterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const count = 14;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: MainThemeColors.secondaryBackground,
            width: 1,
          ),
        ),
      ),
      child: Text(
        '${Labels.questionsQuestionsFound}: $count',
        style: TextStyle(
          color: MainThemeColors.mainText,
        ),
      ),
    );
  }
}

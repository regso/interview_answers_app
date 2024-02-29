import 'package:flutter/material.dart';
import 'package:interview_answers_app/config/constants.dart';
import 'package:interview_answers_app/config/labels.dart';
import 'package:interview_answers_app/config/main_theme_colors.dart';

class BottomBarWidget extends StatelessWidget {
  const BottomBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: MainThemeColors.secondaryBackground,
            spreadRadius: 5,
            blurRadius: 8,
            offset: Offset(0, 0),
          ),
        ],
        color: MainThemeColors.mainBackground,
      ),
      height: Constants.cardHeight,
      child: Row(
        children: [
          const SizedBox(width: Constants.screenHorizontalPadding),
          Expanded(
            flex: 65,
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: MainThemeColors.accent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(Constants.cardIconRadius),
                  ),
                ),
                height: Constants.cardIconHeight,
                child: const Center(
                  child: Text(
                    Labels.answerLearned,
                    style: TextStyle(
                      color: MainThemeColors.mainBackground,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: Constants.screenHorizontalPadding),
          Expanded(
            flex: 35,
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: MainThemeColors.secondaryBackground,
                  borderRadius: BorderRadius.all(
                    Radius.circular(Constants.cardIconRadius),
                  ),
                ),
                height: Constants.cardIconHeight,
                child: const Center(
                  child: Text(
                    Labels.answerRepeat,
                    style: TextStyle(
                      color: MainThemeColors.mainText,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: Constants.screenHorizontalPadding),
        ],
      ),
    );
  }
}

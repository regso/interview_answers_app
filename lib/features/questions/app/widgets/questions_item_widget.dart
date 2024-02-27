import 'package:flutter/material.dart';
import 'package:interview_answers_app/config/constants.dart';
import 'package:interview_answers_app/config/main_theme_colors.dart';
import 'package:interview_answers_app/features/answer/app/screens/answer_screen.dart';

class QuestionsItemWidget extends StatelessWidget {
  final String title;
  final String lastDate;

  const QuestionsItemWidget({
    super.key,
    required this.title,
    required this.lastDate,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => const AnswerScreen(),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: MainThemeColors.secondaryBackground,
            ),
          ),
        ),
        height: Constants.cardHeight,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Constants.cardIconRadius),
                color: MainThemeColors.secondaryBackground,
              ),
              width: Constants.cardIconHeight,
              height: Constants.cardIconHeight,
              padding: const EdgeInsets.only(top: 1),
              child: Center(
                child: Text(
                  '12',
                  style: TextStyle(
                    color: MainThemeColors.secondaryText,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: Constants.screenHorizontalPadding),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: MainThemeColors.mainText,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    lastDate,
                    style: TextStyle(
                      color: MainThemeColors.secondaryText,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: AlignmentDirectional.centerEnd,
              width: 30,
              child: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 18,
                color: MainThemeColors.mainText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

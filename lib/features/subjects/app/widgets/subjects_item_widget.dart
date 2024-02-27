import 'package:flutter/material.dart';
import 'package:interview_answers_app/config/constants.dart';
import 'package:interview_answers_app/config/main_theme_colors.dart';
import 'package:interview_answers_app/features/questions/app/screens/questions_screen.dart';
import 'package:interview_answers_app/features/subjects/app/widgets/list_icon_widget.dart';

class SubjectsItemWidget extends StatelessWidget {
  final String title;
  final int percent;
  final String lastDate;
  final String? iconSvgPath;
  final IconData? iconData;

  const SubjectsItemWidget({
    super.key,
    required this.title,
    required this.percent,
    required this.lastDate,
    this.iconSvgPath,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(
        Radius.circular(
          Constants.cardRadius,
        ),
      ),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => const QuestionsScreen(),
        ),
      ),
      child: Container(
        height: Constants.cardHeight,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              Constants.cardRadius,
            ),
          ),
          border: Border.all(
            color: MainThemeColors.secondaryBackground,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            const SizedBox(width: Constants.screenHorizontalPadding),
            ListIconWidget(iconSvgPath: iconSvgPath, iconData: iconData),
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
                      fontSize: Constants.cardTitleSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    lastDate,
                    style: TextStyle(
                      color: MainThemeColors.secondaryText,
                      fontSize: Constants.cardSubtitleSize,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: Constants.cardIconHeight,
              height: Constants.cardIconHeight,
              child: Center(
                child: Text(
                  '$percent%',
                  style:
                      TextStyle(fontSize: 14, color: MainThemeColors.mainText),
                ),
              ),
            ),
            const SizedBox(width: Constants.screenHorizontalPadding),
          ],
        ),
      ),
    );
  }
}

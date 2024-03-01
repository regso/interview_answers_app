import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:interview_answers_app/config/constants.dart';
import 'package:interview_answers_app/config/main_theme_colors.dart';
import 'package:interview_answers_app/features/questions/app/screens/questions_screen.dart';

class SubjectsItemWidget extends StatelessWidget {
  final int id;
  final String title;
  final String icon;
  final int percent;
  final String lastDate;

  const SubjectsItemWidget({
    super.key,
    required this.id,
    required this.title,
    required this.icon,
    required this.percent,
    required this.lastDate,
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
          builder: (BuildContext context) => QuestionsScreen(
            subjectId: id,
          ),
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
            SizedBox(
              width: Constants.cardIconHeight,
              height: Constants.cardIconHeight,
              child: icon.isNotEmpty ? SvgPicture.string(icon) : Container(),
            ),
            const SizedBox(width: Constants.screenHorizontalPadding),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: MainThemeColors.mainText,
                      fontSize: Constants.cardTitleSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    lastDate,
                    style: const TextStyle(
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
                  style: const TextStyle(
                      fontSize: 14, color: MainThemeColors.mainText),
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

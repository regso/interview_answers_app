import 'package:flutter/material.dart';
import 'package:interview_answers_app/config/main_theme_colors.dart';
import 'package:interview_answers_app/features/subjects/app/widgets/list_icon_widget.dart';

class SubjectsItemWidget extends StatelessWidget {
  final String title;
  final int percent;
  final String lastDate;
  final String? iconSvgPath;
  final IconData? iconData;

  const SubjectsItemWidget({
    Key? key,
    required this.title,
    required this.percent,
    required this.lastDate,
    this.iconSvgPath,
    this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 20),
      height: 90,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: Border.all(
          color: MainThemeColors.secondaryBackground,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 15),
            child: ListIconWidget(iconSvgPath: iconSvgPath, iconData: iconData),
          ),
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
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 38,
            height: 38,
            child: Center(
              child: Text(
                '$percent%',
                style: TextStyle(fontSize: 14, color: MainThemeColors.mainText),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

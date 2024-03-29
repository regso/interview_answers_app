import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:interview_answers_app/config/constants.dart';
import 'package:interview_answers_app/config/main_theme_colors.dart';

class ListIconWidget extends StatelessWidget {
  final String? iconSvgPath;
  final IconData? iconData;

  const ListIconWidget({
    super.key,
    this.iconSvgPath,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return iconSvgPath is String
        ? SizedBox(
            width: Constants.cardIconHeight,
            height: Constants.cardIconHeight,
            child: SvgPicture.asset(iconSvgPath!),
          )
        : Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  Constants.cardIconRadius,
                ),
              ),
              color: MainThemeColors.secondaryBackground,
            ),
            width: Constants.cardIconHeight,
            height: Constants.cardIconHeight,
            child: Icon(
              iconData,
              size: 28,
              color: MainThemeColors.secondaryText,
            ),
          );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:interview_answers_app/config/main_theme_colors.dart';

class ListIconWidget extends StatelessWidget {
  final String? iconSvgPath;
  final IconData? iconData;

  const ListIconWidget({
    Key? key,
    this.iconSvgPath,
    this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return iconSvgPath is String
        ? SizedBox(
            width: 36,
            height: 36,
            child: SvgPicture.asset(iconSvgPath!),
          )
        : Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: MainThemeColors.secondaryBackground,
            ),
            width: 36,
            height: 36,
            child: Icon(
              iconData,
              size: 24,
              color: MainThemeColors.secondaryText,
            ),
          );
  }
}

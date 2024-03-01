import 'package:flutter/material.dart';
import 'package:interview_answers_app/config/main_theme_colors.dart';

class StarsWidget extends StatelessWidget {
  const StarsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.star_border_outlined,
          size: 24,
          color: MainThemeColors.accent,
        ),
        SizedBox(width: 10),
        Icon(
          Icons.star_border_outlined,
          size: 24,
          color: MainThemeColors.secondaryBackground,
        ),
        SizedBox(width: 10),
        Icon(
          Icons.star_border_outlined,
          size: 24,
          color: MainThemeColors.secondaryBackground,
        ),
      ],
    );
  }
}

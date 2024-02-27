import 'package:flutter/material.dart';
import 'package:interview_answers_app/config/constants.dart';
import 'package:interview_answers_app/config/main_theme_colors.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(Constants.cardIconRadius),
                  ),
                  borderSide: BorderSide(
                    color: MainThemeColors.secondaryBackground,
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(Constants.cardIconRadius),
                  ),
                  borderSide: BorderSide(
                    color: MainThemeColors.secondaryText,
                    width: 2,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                isDense: true,
                prefixIcon: const Icon(Icons.search_sharp, size: 24),
                prefixIconColor: MainThemeColors.secondaryBackground,
                prefixIconConstraints: const BoxConstraints(
                  minWidth: 40,
                  minHeight: 40,
                ),
                suffixIcon: const Icon(Icons.highlight_off_sharp, size: 20),
                suffixIconColor: MainThemeColors.secondaryBackground,
                suffixIconConstraints: const BoxConstraints(
                  minWidth: 40,
                  minHeight: 40,
                ),
              ),
              style: TextStyle(
                fontSize: 14,
                color: MainThemeColors.mainText,
              ),
            ),
          ),
          const SizedBox(width: Constants.screenHorizontalPadding),
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  Constants.cardIconRadius,
                ),
              ),
              color: MainThemeColors.accent,
            ),
            width: Constants.cardIconHeight,
            height: Constants.cardIconHeight,
            child: Icon(
              Icons.search_sharp,
              color: MainThemeColors.mainBackground,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}

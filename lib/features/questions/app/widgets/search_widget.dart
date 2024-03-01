import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_answers_app/config/constants.dart';
import 'package:interview_answers_app/config/main_theme_colors.dart';
import 'package:interview_answers_app/features/questions/app/bloc/questions_bloc.dart';
import 'package:interview_answers_app/features/questions/app/bloc/questions_event.dart';

class SearchWidget extends StatefulWidget {
  final int subjectId;

  const SearchWidget({super.key, required this.subjectId});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final _searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final questionsBloc = BlocProvider.of<QuestionsBloc>(context);

    return Container(
      height: 90,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _searchTextController,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(Constants.cardIconRadius),
                  ),
                  borderSide: BorderSide(
                    color: MainThemeColors.secondaryBackground,
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(Constants.cardIconRadius),
                  ),
                  borderSide: BorderSide(
                    color: MainThemeColors.secondaryText,
                    width: 2,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                isDense: true,
                prefixIcon: Icon(Icons.search_sharp, size: 24),
                prefixIconColor: MainThemeColors.secondaryBackground,
                prefixIconConstraints: BoxConstraints(
                  minWidth: 40,
                  minHeight: 40,
                ),
                suffixIcon: Icon(Icons.highlight_off_sharp, size: 20),
                suffixIconColor: MainThemeColors.secondaryBackground,
                suffixIconConstraints: BoxConstraints(
                  minWidth: 40,
                  minHeight: 40,
                ),
              ),
              style: const TextStyle(
                fontSize: 14,
                color: MainThemeColors.mainText,
              ),
            ),
          ),
          const SizedBox(width: Constants.screenHorizontalPadding),
          InkWell(
            onTap: () async {
              questionsBloc.add(FilterQuestionsEvent(
                subjectId: widget.subjectId,
                filter: _searchTextController.text,
              ));
            },
            borderRadius: const BorderRadius.all(
              Radius.circular(
                Constants.cardIconRadius,
              ),
            ),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    Constants.cardIconRadius,
                  ),
                ),
                color: MainThemeColors.accent,
              ),
              width: Constants.cardIconHeight,
              height: Constants.cardIconHeight,
              child: const Icon(
                Icons.search_outlined,
                color: MainThemeColors.mainBackground,
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchTextController.dispose();
    super.dispose();
  }
}

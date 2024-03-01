import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_answers_app/config/constants.dart';
import 'package:interview_answers_app/config/main_theme_colors.dart';
import 'package:interview_answers_app/features/answer/app/bloc/answer_bloc.dart';
import 'package:interview_answers_app/features/answer/app/bloc/answer_event.dart';
import 'package:interview_answers_app/features/answer/app/widgets/answer_widget.dart';
import 'package:interview_answers_app/features/answer/app/widgets/bottom_widget.dart';

class AnswerScreen extends StatelessWidget {
  final int subjectId;
  final int questionId;

  const AnswerScreen({
    super.key,
    required this.subjectId,
    required this.questionId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_sharp,
            color: MainThemeColors.mainText,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: Constants.screenHorizontalPadding,
          ),
          child: BlocProvider<AnswerBloc>(
            create: (BuildContext context) {
              return AnswerBloc()
                ..add(
                  LoadAnswerEvent(subjectId: subjectId, questionId: questionId),
                );
            },
            child: const AnswerWidget(),
          ),
        ),
      ),
      bottomNavigationBar: const BottomBarWidget(),
    );
  }
}

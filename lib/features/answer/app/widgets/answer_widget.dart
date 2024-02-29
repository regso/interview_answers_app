import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_answers_app/config/main_theme_colors.dart';
import 'package:interview_answers_app/features/answer/app/bloc/answer_bloc.dart';
import 'package:interview_answers_app/features/answer/app/bloc/answer_state.dart';
import 'package:interview_answers_app/features/answer/app/widgets/answer_icon.dart';
import 'package:interview_answers_app/features/answer/app/widgets/answer_text_widget.dart';
import 'package:interview_answers_app/features/answer/app/widgets/stars_widget.dart';

class AnswerWidget extends StatelessWidget {
  const AnswerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnswerBloc, AnswerState>(
        builder: (BuildContext context, AnswerState state) {
          if (state is InitAnswerState) {
            return Container();
          }

          if (state is LoadingAnswerState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is LoadedAnswerState) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const AnswerIcon(),
                  const SizedBox(height: 30),
                  Text(
                    state.question.question,
                    style: const TextStyle(
                      color: MainThemeColors.mainText,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const StarsWidget(),
                  const SizedBox(height: 50),
                  AnswerTextWidget(answer: state.question.answer),
                ],
              ),
            );
          }

          return const Text('Error.');
        }
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_answers_app/config/constants.dart';
import 'package:interview_answers_app/features/questions/app/bloc/questions_bloc.dart';
import 'package:interview_answers_app/features/questions/app/bloc/questions_state.dart';
import 'package:interview_answers_app/features/questions/app/widgets/questions_item_widget.dart';
import 'package:interview_answers_app/features/questions/app/widgets/search_delimiter_widget.dart';
import 'package:interview_answers_app/features/questions/app/widgets/search_widget.dart';

class QuestionsWidget extends StatelessWidget {
  const QuestionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionsBloc, QuestionsState>(
        builder: (BuildContext context, QuestionsState state) {
      if (state is InitQuestionsState) {
        return Container();
      }

      if (state is LoadingQuestionsState) {
        return const Center(child: CircularProgressIndicator());
      }

      if (state is LoadedQuestionsState) {
        return Container(
          padding: const EdgeInsets.all(Constants.screenHorizontalPadding),
          child: Column(
            children: [
              const SearchWidget(),
              const SearchDelimiterWidget(),
              Expanded(
                child: ListView(children: [
                  for (final question in state.questions)
                    QuestionsItemWidget(
                      title: question.title,
                      lastDate: 'today',
                    ),
                ]),
              ),
            ],
          ),
        );
      }

      return const Text('Error.');
    });
  }
}

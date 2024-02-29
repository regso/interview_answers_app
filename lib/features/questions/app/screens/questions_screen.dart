import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_answers_app/config/main_theme_colors.dart';
import 'package:interview_answers_app/features/questions/app/bloc/questions_bloc.dart';
import 'package:interview_answers_app/features/questions/app/bloc/questions_event.dart';
import 'package:interview_answers_app/features/questions/app/widgets/questions_widget.dart';

class QuestionsScreen extends StatelessWidget {
  final int subjectId;

  const QuestionsScreen({super.key, required this.subjectId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Questions',
          style: TextStyle(color: MainThemeColors.mainText),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_sharp,
            color: MainThemeColors.mainText,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: BlocProvider<QuestionsBloc>(
          create: (BuildContext context) {
            return QuestionsBloc()
              ..add(
                LoadQuestionsEvent(subjectId: subjectId),
              );
          },
          child: const QuestionsWidget(),
        ),
      ),
    );
  }
}

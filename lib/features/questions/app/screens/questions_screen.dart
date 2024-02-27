import 'package:flutter/material.dart';
import 'package:interview_answers_app/config/constants.dart';
import 'package:interview_answers_app/features/questions/app/widgets/questions_widget.dart';
import 'package:interview_answers_app/features/questions/app/widgets/search_delimiter_widget.dart';
import 'package:interview_answers_app/features/questions/app/widgets/search_widget.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Questions'),
        centerTitle: true,
        leading: const Icon(Icons.arrow_back_ios_sharp),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(Constants.screenHorizontalPadding),
          child: const Column(
            children: [
              SearchWidget(),
              SearchDelimiterWidget(),
              QuestionsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

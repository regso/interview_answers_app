import 'package:flutter/material.dart';
import 'package:interview_answers_app/config/constants.dart';

class AnswerScreen extends StatelessWidget {
  const AnswerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Answer'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_sharp),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(Constants.screenHorizontalPadding),
          child: const Text('answer'),
        ),
      ),
    );
  }
}

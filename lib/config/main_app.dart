import 'package:flutter/material.dart';
import 'package:interview_answers_app/features/questions/app/screens/questions_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Interview Answers',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const QuestionsScreen(),
    );
  }
}

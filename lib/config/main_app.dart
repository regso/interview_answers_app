import 'package:flutter/material.dart';
import 'package:interview_answers_app/features/subjects/app/screens/subjects_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Interview Answers',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const SubjectsScreen(),
    );
  }
}

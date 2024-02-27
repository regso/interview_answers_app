import 'package:flutter/material.dart';
import 'package:interview_answers_app/config/main_theme_colors.dart';
import 'package:interview_answers_app/features/subjects/app/widgets/subjects_widget.dart';

class SubjectsScreen extends StatelessWidget {
  const SubjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Interview Answers',
          style: TextStyle(color: MainThemeColors.mainText),
        ),
        centerTitle: true,
        leading: const Icon(
          Icons.menu,
          color: MainThemeColors.mainText,
        ),
      ),
      body: const SafeArea(
        child: SubjectsWidget(),
      ),
    );
  }
}

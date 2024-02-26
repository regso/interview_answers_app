import 'package:flutter/material.dart';
import 'package:interview_answers_app/features/subjects/app/widgets/subjects_widget.dart';

class SubjectsScreen extends StatelessWidget {
  const SubjectsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interview Answers'),
        centerTitle: true,
        leading: const Icon(Icons.menu),
      ),
      body: SafeArea(
        child: SubjectsWidget(),
      ),
    );
  }
}

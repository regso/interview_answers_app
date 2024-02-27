import 'package:flutter/material.dart';
import 'package:interview_answers_app/features/questions/app/widgets/questions_item_widget.dart';

class QuestionsWidget extends StatelessWidget {
  static const questionsData = [
    {
      'title': 'Description',
      'lastDate': 'today',
    },
    {
      'title': 'Lifecycle',
      'lastDate': '15.01.2024',
    },
    {
      'title': 'Render',
      'lastDate': 'yesterday',
    },
  ];

  const QuestionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(children: [
        for (final q in questionsData)
          QuestionsItemWidget(
            title: q['title']!,
            lastDate: q['lastDate']!,
          ),
      ]),
    );
  }
}

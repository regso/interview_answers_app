import 'package:flutter/material.dart';
import 'package:interview_answers_app/config/constants.dart';
import 'package:interview_answers_app/features/subjects/app/widgets/subjects_item_widget.dart';

class SubjectsWidget extends StatelessWidget {
  static const subjectsData = [
    {
      'title': 'Flutter',
      'iconSvgPath': Constants.assetPathFlutterIcon,
      'iconData': null,
      'percent': 10,
      'lastDate': 'yesterday',
    },
    {
      'title': 'Dart',
      'iconSvgPath': Constants.assetPathDartIcon,
      'iconData': null,
      'percent': 50,
      'lastDate': 'today',
    },
    {
      'title': 'General',
      'iconSvgPath': null,
      'iconData': Icons.public,
      'percent': 0,
      'lastDate': 'not started',
    },
    {
      'title': 'HR',
      'iconSvgPath': null,
      'iconData': Icons.assignment_ind,
      'percent': 12,
      'lastDate': '15.01.2024',
    },
  ];

  const SubjectsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(Constants.screenHorizontalPadding),
      children: [
        for (final subject in subjectsData) ...[
          SubjectsItemWidget(
            title: subject['title'] as String,
            iconSvgPath: subject['iconSvgPath'] as String?,
            iconData: subject['iconData'] as IconData?,
            percent: subject['percent'] as int,
            lastDate: subject['lastDate'] as String,
          ),
          const SizedBox(height: Constants.screenHorizontalPadding),
        ],
      ],
    );
  }
}

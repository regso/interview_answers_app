import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_answers_app/config/constants.dart';
import 'package:interview_answers_app/config/labels.dart';
import 'package:interview_answers_app/features/subjects/app/bloc/subjects_bloc.dart';
import 'package:interview_answers_app/features/subjects/app/bloc/subjects_state.dart';
import 'package:interview_answers_app/features/subjects/app/widgets/subjects_item_widget.dart';

class SubjectsWidget extends StatelessWidget {
  const SubjectsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubjectsBloc, SubjectsState>(
      builder: (BuildContext context, SubjectsState state) {
        if (state is InitSubjectsState) {
          return Container();
        }

        if (state is LoadingSubjectsState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is LoadedSubjectsState) {
          return ListView(
            padding: const EdgeInsets.all(Constants.screenHorizontalPadding),
            children: [
              for (final subject in state.subjects) ...[
                SubjectsItemWidget(
                  id: subject.id,
                  title: subject.title,
                  icon: subject.icon,
                  percent: 0,
                  lastDate: Labels.subjectsToday,
                ),
                const SizedBox(height: Constants.screenHorizontalPadding),
              ],
            ],
          );
        }

        return const Text('Error.');
      },
    );
  }
}

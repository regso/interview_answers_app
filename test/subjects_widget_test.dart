import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:interview_answers_app/features/subjects/app/bloc/subjects_bloc.dart';
import 'package:interview_answers_app/features/subjects/app/bloc/subjects_event.dart';
import 'package:interview_answers_app/features/subjects/app/widgets/subjects_widget.dart';
import 'package:interview_answers_app/features/subjects/domain/entities/subject_entity.dart';
import 'package:interview_answers_app/features/subjects/domain/repositories/abstract_subject_repository.dart';
import 'package:interview_answers_app/features/subjects/domain/use_cases/find_subjects_use_case.dart';
import 'package:mocktail/mocktail.dart';

class MockSubjectRepository extends Mock implements AbstractSubjectRepository {}

const subjectTitle = 'Subject 1';
const subjects = [
  SubjectEntity(id: 1, title: subjectTitle, icon: ''),
];

void main() {
  testWidgets('Subjects widget test.', (widgetTester) async {
    // Repository.
    final subjectRepository = MockSubjectRepository();
    when(() => subjectRepository.findSubjects()).thenAnswer(
      (_) async => subjects,
    );

    final sl = GetIt.instance;
    sl.registerLazySingleton(
      () => FindSubjectsUseCase(subjectRepository: subjectRepository),
    );

    await widgetTester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BlocProvider<SubjectsBloc>(
            create: (BuildContext context) {
              final bloc = SubjectsBloc()..add(const LoadSubjectsEvent());
              return bloc;
            },
            child: const SubjectsWidget(),
          ),
        ),
      ),
    );

    await widgetTester.pump();
    expect(find.text(subjectTitle), findsOneWidget);
    verify(() => subjectRepository.findSubjects()).called(1);
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:interview_answers_app/features/questions/app/bloc/questions_bloc.dart';
import 'package:interview_answers_app/features/questions/app/bloc/questions_event.dart';
import 'package:interview_answers_app/features/questions/app/widgets/questions_widget.dart';
import 'package:interview_answers_app/features/questions/domain/entities/question_entity.dart';
import 'package:interview_answers_app/features/questions/domain/repositories/abstract_question_repository.dart';
import 'package:interview_answers_app/features/questions/domain/use_cases/find_questions_by_filter_use_case.dart';
import 'package:interview_answers_app/features/questions/domain/use_cases/find_questions_use_case.dart';
import 'package:interview_answers_app/features/questions/domain/use_cases/get_question_ids_by_filter_use_case.dart';
import 'package:mocktail/mocktail.dart';

class MockQuestionRepository extends Mock
    implements AbstractQuestionRepository {}

const questionTitle = 'Question title.';
const questionText = 'Question text.';
const questionAnswer = 'Question answer.';
const notFoundText = 'Not found text.';
const subjectId = 1;
const questions = [
  QuestionEntity(
      id: 1,
      subjectId: subjectId,
      title: questionTitle,
      question: questionText,
      answer: questionAnswer,
      difficulty: 1),
];

void main() {
  testWidgets('Filter questions negative widget test.', (widgetTester) async {
    final questionRepository = MockQuestionRepository();
    when(
      () => questionRepository.findQuestions(subjectId: subjectId),
    ).thenAnswer(
      (_) async => questions,
    );
    when(
      () => questionRepository.findQuestionsByFilter(
        subjectId: subjectId,
        filter: questionTitle,
      ),
    ).thenAnswer(
      (_) async => [],
    );

    final sl = GetIt.instance;
    sl.registerLazySingleton(
      () => FindQuestionsUseCase(
        questionRepository: questionRepository,
      ),
    );
    sl.registerLazySingleton(
      () => FindQuestionsByFilterUseCase(
        questionRepository: questionRepository,
      ),
    );
    sl.registerLazySingleton(
      () => GetQuestionIdsByFilterUseCase(),
    );

    await widgetTester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BlocProvider<QuestionsBloc>(
            create: (BuildContext context) {
              return QuestionsBloc()
                ..add(
                  const FilterQuestionsEvent(
                    subjectId: subjectId,
                    filter: notFoundText,
                  ),
                );
            },
            child: const QuestionsWidget(),
          ),
        ),
      ),
    );

    await widgetTester.pump();
    expect(find.text(questionTitle), findsNothing);
  });
}

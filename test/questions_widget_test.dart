import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:interview_answers_app/features/questions/app/bloc/questions_bloc.dart';
import 'package:interview_answers_app/features/questions/app/bloc/questions_event.dart';
import 'package:interview_answers_app/features/questions/app/widgets/questions_widget.dart';
import 'package:interview_answers_app/features/questions/domain/entities/question_entity.dart';
import 'package:interview_answers_app/features/questions/domain/repositories/abstract_question_repository.dart';
import 'package:interview_answers_app/features/questions/domain/use_cases/find_questions_use_case.dart';
import 'package:mocktail/mocktail.dart';

class MockQuestionRepository extends Mock
    implements AbstractQuestionRepository {}

const questionTitle = 'Question title.';
const questionText = 'Question text.';
const questionAnswer = 'Question answer.';
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
  testWidgets('Questions widget test.', (widgetTester) async {
    final questionRepository = MockQuestionRepository();
    when(() => questionRepository.findQuestions(subjectId: subjectId))
        .thenAnswer(
      (_) async => questions,
    );

    final sl = GetIt.instance;
    sl.registerLazySingleton(
      () => FindQuestionsUseCase(questionRepository: questionRepository),
    );

    await widgetTester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BlocProvider<QuestionsBloc>(
            create: (BuildContext context) {
              return QuestionsBloc()
                ..add(
                  const LoadQuestionsEvent(
                    subjectId: subjectId,
                  ),
                );
            },
            child: const QuestionsWidget(),
          ),
        ),
      ),
    );

    await widgetTester.pump();
    expect(find.text(questionTitle), findsOneWidget);
    expect(find.text(questionText), findsNothing);
    verify(() => questionRepository.findQuestions(subjectId: subjectId))
        .called(1);
  });
}

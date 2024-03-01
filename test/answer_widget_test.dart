import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:interview_answers_app/features/answer/app/bloc/answer_bloc.dart';
import 'package:interview_answers_app/features/answer/app/bloc/answer_event.dart';
import 'package:interview_answers_app/features/answer/app/widgets/answer_widget.dart';
import 'package:interview_answers_app/features/answer/domain/use_cases/get_question_use_case.dart';
import 'package:interview_answers_app/features/questions/domain/entities/question_entity.dart';
import 'package:interview_answers_app/features/questions/domain/repositories/abstract_question_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockQuestionRepository extends Mock
    implements AbstractQuestionRepository {}

const questionTitle = 'Question title.';
const questionText = 'Question text.';
const questionAnswer = 'Question answer.';
const questionId = 1;
const subjectId = 1;
const question = QuestionEntity(
  id: questionId,
  subjectId: subjectId,
  title: questionTitle,
  question: questionText,
  answer: questionAnswer,
  difficulty: 1,
);

void main() {
  testWidgets('Answer widget test.', (widgetTester) async {
    final questionRepository = MockQuestionRepository();
    when(
      () => questionRepository.getQuestion(
        subjectId: subjectId,
        questionId: questionId,
      ),
    ).thenAnswer(
      (_) async => question,
    );

    final sl = GetIt.instance;
    sl.registerLazySingleton(
      () => GetQuestionUseCase(questionRepository: questionRepository),
    );

    await widgetTester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BlocProvider<AnswerBloc>(
            create: (BuildContext context) {
              return AnswerBloc()
                ..add(
                  const LoadAnswerEvent(
                    subjectId: subjectId,
                    questionId: questionId,
                  ),
                );
            },
            child: const AnswerWidget(),
          ),
        ),
      ),
    );

    await widgetTester.pump();
    expect(find.text(questionTitle), findsNothing);
    expect(find.text(questionText), findsOneWidget);
    expect(find.text(questionAnswer), findsOneWidget);
    verify(
      () => questionRepository.getQuestion(
        subjectId: subjectId,
        questionId: questionId,
      ),
    ).called(1);
  });
}

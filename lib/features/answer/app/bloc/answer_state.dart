import 'package:interview_answers_app/features/questions/domain/entities/question_entity.dart';

sealed class AnswerState {
  const AnswerState();
}

class InitAnswerState extends AnswerState {
  const InitAnswerState();
}

class LoadingAnswerState extends AnswerState {
  const LoadingAnswerState();
}

class LoadedAnswerState extends AnswerState {
  final QuestionEntity question;

  const LoadedAnswerState({
    required this.question,
  });
}

class ErrorAnswerState extends AnswerState {
  const ErrorAnswerState();
}

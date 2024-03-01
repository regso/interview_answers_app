import 'package:interview_answers_app/features/questions/domain/entities/question_entity.dart';

sealed class QuestionsState {
  const QuestionsState();
}

class InitQuestionsState extends QuestionsState {
  const InitQuestionsState();
}

class LoadingQuestionsState extends QuestionsState {
  const LoadingQuestionsState();
}

class LoadedQuestionsState extends QuestionsState {
  final int subjectId;
  final List<QuestionEntity> questions;

  const LoadedQuestionsState({
    required this.subjectId,
    required this.questions,
  });
}

class ErrorQuestionsState extends QuestionsState {
  const ErrorQuestionsState();
}

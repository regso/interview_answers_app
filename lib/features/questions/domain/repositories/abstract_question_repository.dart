import 'package:interview_answers_app/features/questions/domain/entities/question_entity.dart';

abstract interface class AbstractQuestionRepository {
  Future<List<QuestionEntity>> findQuestions({
    required int subjectId,
  });

  Future<List<QuestionEntity>> findQuestionsByFilter({
    required int subjectId,
    required String filter,
  });

  Future<QuestionEntity> getQuestion({
    required int subjectId,
    required int questionId,
  });
}

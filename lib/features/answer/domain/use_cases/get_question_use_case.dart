import 'package:interview_answers_app/features/questions/domain/entities/question_entity.dart';
import 'package:interview_answers_app/features/questions/domain/repositories/abstract_question_repository.dart';

class GetQuestionUseCase {
  final AbstractQuestionRepository questionRepository;

  GetQuestionUseCase({required this.questionRepository});

  Future<QuestionEntity> call({
    required int subjectId,
    required int questionId,
  }) =>
      questionRepository.getQuestion(
        subjectId: subjectId,
        questionId: questionId,
      );
}

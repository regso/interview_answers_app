import 'package:interview_answers_app/features/questions/domain/entities/question_entity.dart';
import 'package:interview_answers_app/features/questions/domain/repositories/abstract_question_repository.dart';

class FindQuestionsUseCase {
  final AbstractQuestionRepository questionRepository;

  FindQuestionsUseCase({required this.questionRepository});

  Future<List<QuestionEntity>> call({
    required int subjectId,
  }) =>
      questionRepository.findQuestions(
        subjectId: subjectId,
      );
}

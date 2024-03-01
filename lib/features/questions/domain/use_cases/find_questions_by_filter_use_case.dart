import 'package:interview_answers_app/features/questions/domain/entities/question_entity.dart';
import 'package:interview_answers_app/features/questions/domain/repositories/abstract_question_repository.dart';

class FindQuestionsByFilterUseCase {
  final AbstractQuestionRepository questionRepository;

  FindQuestionsByFilterUseCase({required this.questionRepository});

  Future<List<QuestionEntity>> call({
    required int subjectId,
    required String filter,
  }) =>
      questionRepository.findQuestionsByFilter(
        subjectId: subjectId,
        filter: filter,
      );
}

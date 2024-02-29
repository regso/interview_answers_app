import 'package:interview_answers_app/features/questions/data/data_sources/remote_question_data_source.dart';
import 'package:interview_answers_app/features/questions/domain/entities/question_entity.dart';
import 'package:interview_answers_app/features/questions/domain/repositories/abstract_question_repository.dart';

class QuestionRepository implements AbstractQuestionRepository {
  final RemoteQuestionDataSource remoteQuestionDataSource;

  QuestionRepository({required this.remoteQuestionDataSource});

  @override
  Future<List<QuestionEntity>> findQuestions({
    required int subjectId,
    required int questionId,
  }) async {
    final items = await remoteQuestionDataSource.findQuestions(
      subjectId: subjectId,
      questionId: questionId,
    );
    return items
        .map(
          (final item) => QuestionEntity(
            id: item['id'],
            title: item['title'],
            question: item['question'],
            answer: item['answer'],
            difficulty: item['difficulty'],
          ),
        )
        .toList();
  }
}
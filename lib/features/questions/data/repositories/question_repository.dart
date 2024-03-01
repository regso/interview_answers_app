import 'package:flutter/foundation.dart';
import 'package:interview_answers_app/features/questions/data/data_sources/remote_question_data_source.dart';
import 'package:interview_answers_app/features/questions/domain/dto/questions_filter_dto.dart';
import 'package:interview_answers_app/features/questions/domain/entities/question_entity.dart';
import 'package:interview_answers_app/features/questions/domain/repositories/abstract_question_repository.dart';
import 'package:interview_answers_app/features/questions/domain/use_cases/find_questions_use_case.dart';
import 'package:interview_answers_app/features/questions/domain/use_cases/get_question_ids_by_filter_use_case.dart';
import 'package:interview_answers_app/main.dart';

class QuestionRepository implements AbstractQuestionRepository {
  final RemoteQuestionDataSource remoteQuestionDataSource;

  QuestionRepository({required this.remoteQuestionDataSource});

  @override
  Future<List<QuestionEntity>> findQuestions({
    required int subjectId,
  }) async {
    final items = await remoteQuestionDataSource.findQuestions(
      subjectId: subjectId,
    );
    return items
        .map(
          (final item) => QuestionEntity(
            id: item['id'],
            subjectId: item['subjectId'],
            title: item['title'],
            question: item['question'],
            answer: item['answer'],
            difficulty: item['difficulty'],
          ),
        )
        .toList();
  }

  @override
  Future<List<QuestionEntity>> findQuestionsByFilter({
    required int subjectId,
    required String filter,
  }) async {
    final questions = await sl<FindQuestionsUseCase>()(
      subjectId: subjectId,
    );
    final questionsFilter = QuestionsFilterDto(
      filter: filter,
      questions: questions,
    );
    final filteredQuestionIds = await compute((
      QuestionsFilterDto questionsFilter,
    ) async {
      final findQuestionIds = GetQuestionIdsByFilterUseCase();
      return await findQuestionIds(questionsFilter: questionsFilter);
    }, questionsFilter);

    return questions
        .where(
          (final question) => filteredQuestionIds.contains(
            question.id,
          ),
        )
        .toList();
  }

  @override
  Future<QuestionEntity> getQuestion({
    required int subjectId,
    required int questionId,
  }) async {
    final item = await remoteQuestionDataSource.getQuestion(
      subjectId: subjectId,
      questionId: questionId,
    );
    return QuestionEntity(
      id: item['id'],
      subjectId: item['subjectId'],
      title: item['title'],
      question: item['question'],
      answer: item['answer'],
      difficulty: item['difficulty'],
    );
  }
}

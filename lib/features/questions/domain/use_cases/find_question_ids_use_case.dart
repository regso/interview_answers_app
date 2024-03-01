import 'package:interview_answers_app/features/questions/domain/dto/questions_filter_dto.dart';

class FindQuestionIdsUseCase {
  Future<List<int>> call({required QuestionsFilterDto questionsFilter}) async {
    List<int> filteredIds = [];
    for (final question in questionsFilter.questions) {
      if (question.title.contains(RegExp(
            questionsFilter.filter,
            caseSensitive: false,
          )) ||
          question.question.contains(RegExp(
            questionsFilter.filter,
            caseSensitive: false,
          )) ||
          question.answer.contains(RegExp(
            questionsFilter.filter,
            caseSensitive: false,
          ))) {
        filteredIds.add(question.id);
      }
    }
    return filteredIds;
  }
}

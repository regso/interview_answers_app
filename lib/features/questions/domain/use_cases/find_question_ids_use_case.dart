import 'dart:developer';

import 'package:interview_answers_app/features/questions/domain/dto/questions_filter_dto.dart';

class FindQuestionIdsUseCase {
  Future<List<int>> call({required QuestionsFilterDto questionsFilter}) async {

    log(questionsFilter.filter);
    log(questionsFilter.questions.toString());

    return [1, 3];
  }
}

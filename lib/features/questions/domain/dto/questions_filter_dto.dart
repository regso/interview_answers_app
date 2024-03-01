import 'package:interview_answers_app/features/questions/domain/entities/question_entity.dart';

class QuestionsFilterDto {
  final String filter;
  final List<QuestionEntity> questions;

  QuestionsFilterDto({required this.filter, required this.questions});
}

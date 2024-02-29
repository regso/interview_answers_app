import 'package:json_annotation/json_annotation.dart';

part 'question_entity.g.dart';

@JsonSerializable()
class QuestionEntity {
  final int id;
  final int subjectId;
  final String title;
  final String question;
  final String answer;
  final int difficulty;

  const QuestionEntity({
    required this.id,
    required this.subjectId,
    required this.title,
    required this.question,
    required this.answer,
    required this.difficulty,
  });

  factory QuestionEntity.fromJson(Map<String, dynamic> json) =>
      _$QuestionEntityFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionEntityToJson(this);
}

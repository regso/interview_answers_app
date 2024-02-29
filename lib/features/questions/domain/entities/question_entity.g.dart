// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionEntity _$QuestionEntityFromJson(Map<String, dynamic> json) =>
    QuestionEntity(
      id: json['id'] as int,
      subjectId: json['subjectId'] as int,
      title: json['title'] as String,
      question: json['question'] as String,
      answer: json['answer'] as String,
      difficulty: json['difficulty'] as int,
    );

Map<String, dynamic> _$QuestionEntityToJson(QuestionEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subjectId': instance.subjectId,
      'title': instance.title,
      'question': instance.question,
      'answer': instance.answer,
      'difficulty': instance.difficulty,
    };

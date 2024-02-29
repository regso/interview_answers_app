import 'package:dio/dio.dart';
import 'package:interview_answers_app/config/constants.dart';

class RemoteQuestionDataSource {
  final Dio dio;

  RemoteQuestionDataSource({required this.dio});

  Future<List<Map<String, dynamic>>> findQuestions({
    required int subjectId,
    required int questionId,
  }) async {
    final response = await dio.get(
      '${Constants.apiGetSubjectsUrl}/$subjectId/'
      '${Constants.apiGetQuestionsUrl}/$questionId',
    );
    return List<Map<String, dynamic>>.from(response.data);
  }
}

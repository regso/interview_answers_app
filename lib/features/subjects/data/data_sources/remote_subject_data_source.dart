import 'package:dio/dio.dart';
import 'package:interview_answers_app/config/constants.dart';

class RemoteSubjectDataSource {
  final Dio dio;

  RemoteSubjectDataSource({required this.dio});

  Future<List<Map<String, dynamic>>> findSubjects() async {
    final response = await dio.get(Constants.apiGetSubjectsUrl);
    return List<Map<String, dynamic>>.from(response.data);
  }
}

import 'package:interview_answers_app/config/dio.dart';
import 'package:interview_answers_app/features/answer/domain/use_cases/get_question_use_case.dart';
import 'package:interview_answers_app/features/questions/data/data_sources/remote_question_data_source.dart';
import 'package:interview_answers_app/features/questions/data/repositories/question_repository.dart';
import 'package:interview_answers_app/features/questions/domain/repositories/abstract_question_repository.dart';
import 'package:interview_answers_app/features/questions/domain/use_cases/find_questions_by_filter_use_case.dart';
import 'package:interview_answers_app/features/questions/domain/use_cases/find_questions_use_case.dart';
import 'package:interview_answers_app/features/questions/domain/use_cases/get_question_ids_by_filter_use_case.dart';
import 'package:interview_answers_app/features/subjects/data/data_sources/local_subject_icon_data_source.dart';
import 'package:interview_answers_app/features/subjects/data/data_sources/remote_subject_data_source.dart';
import 'package:interview_answers_app/features/subjects/data/repositories/subject_repository.dart';
import 'package:interview_answers_app/features/subjects/domain/repositories/abstract_subject_repository.dart';
import 'package:interview_answers_app/features/subjects/domain/use_cases/find_subjects_use_case.dart';
import 'package:interview_answers_app/main.dart';

void mainInit() {
  // Data Sources.
  sl.registerLazySingleton(
    () => RemoteSubjectDataSource(
      dio: dio,
    ),
  );
  sl.registerLazySingleton(
    () => LocalSubjectIconDataSource(),
  );
  sl.registerLazySingleton(
    () => RemoteQuestionDataSource(
      dio: dio,
    ),
  );

  // Repositories.
  sl.registerLazySingleton<AbstractSubjectRepository>(
    () => SubjectRepository(
      remoteSubjectDataSource: sl(),
      localSubjectIconDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<AbstractQuestionRepository>(
    () => QuestionRepository(
      remoteQuestionDataSource: sl(),
    ),
  );

  // Use Cases.
  sl.registerLazySingleton(
    () => FindSubjectsUseCase(subjectRepository: sl()),
  );
  sl.registerLazySingleton(
    () => FindQuestionsUseCase(questionRepository: sl()),
  );
  sl.registerLazySingleton(
    () => FindQuestionsByFilterUseCase(questionRepository: sl()),
  );
  sl.registerLazySingleton(
    () => GetQuestionIdsByFilterUseCase(),
  );
  sl.registerLazySingleton(
    () => GetQuestionUseCase(questionRepository: sl()),
  );
}

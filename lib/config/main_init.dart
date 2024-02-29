import 'package:interview_answers_app/config/dio.dart';
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

  // Repositories.
  sl.registerLazySingleton<AbstractSubjectRepository>(
    () => SubjectRepository(
      remoteSubjectDataSource: sl(),
      localSubjectIconDataSource: sl(),
    ),
  );

  // Use Cases.
  sl.registerLazySingleton(
    () => FindSubjectsUseCase(subjectRepository: sl()),
  );
}

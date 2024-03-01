import 'package:interview_answers_app/features/subjects/domain/entities/subject_entity.dart';

abstract interface class AbstractSubjectRepository {
  Future<List<SubjectEntity>> findSubjects();
}

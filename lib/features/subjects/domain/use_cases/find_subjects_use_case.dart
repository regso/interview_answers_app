import 'package:interview_answers_app/features/subjects/domain/entities/subject_entity.dart';
import 'package:interview_answers_app/features/subjects/domain/repositories/abstract_subject_repository.dart';

class FindSubjectsUseCase {
  final AbstractSubjectRepository subjectRepository;

  FindSubjectsUseCase({required this.subjectRepository});

  Future<List<SubjectEntity>> call() => subjectRepository.findSubjects();
}

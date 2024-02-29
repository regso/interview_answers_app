import 'package:interview_answers_app/features/subjects/domain/entities/subject_entity.dart';

sealed class SubjectsState {
  const SubjectsState();
}

class InitSubjectsState extends SubjectsState {
  const InitSubjectsState();
}

class LoadingSubjectsState extends SubjectsState {
  const LoadingSubjectsState();
}

class LoadedSubjectsState extends SubjectsState {
  final List<SubjectEntity> subjects;

  const LoadedSubjectsState({
    required this.subjects,
  });
}

class ErrorSubjectsState extends SubjectsState {
  const ErrorSubjectsState();
}

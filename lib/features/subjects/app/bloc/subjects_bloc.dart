import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_answers_app/features/subjects/app/bloc/subjects_event.dart';
import 'package:interview_answers_app/features/subjects/app/bloc/subjects_state.dart';
import 'package:interview_answers_app/features/subjects/domain/use_cases/find_subjects_use_case.dart';
import 'package:interview_answers_app/main.dart';

class SubjectsBloc extends Bloc<SubjectsEvent, SubjectsState> {
  SubjectsBloc() : super(const InitSubjectsState()) {
    on<LoadSubjectsEvent>(_load);
  }

  void _load(LoadSubjectsEvent event, Emitter<SubjectsState> emit) async {
    try {
      emit(const LoadingSubjectsState());
      final subjects = await sl<FindSubjectsUseCase>()();
      emit(LoadedSubjectsState(subjects: subjects));
    } catch (_) {
      emit(const ErrorSubjectsState());
    }
  }
}

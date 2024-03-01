import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_answers_app/features/questions/app/bloc/questions_event.dart';
import 'package:interview_answers_app/features/questions/app/bloc/questions_state.dart';
import 'package:interview_answers_app/features/questions/domain/use_cases/find_questions_by_filter_use_case.dart';
import 'package:interview_answers_app/features/questions/domain/use_cases/find_questions_use_case.dart';
import 'package:interview_answers_app/main.dart';

class QuestionsBloc extends Bloc<QuestionsEvent, QuestionsState> {
  QuestionsBloc() : super(const InitQuestionsState()) {
    on<LoadQuestionsEvent>(_load);
    on<FilterQuestionsEvent>(_filter);
  }

  void _load(LoadQuestionsEvent event, Emitter<QuestionsState> emit) async {
    try {
      emit(const LoadingQuestionsState());
      final questions = await sl<FindQuestionsUseCase>()(
        subjectId: event.subjectId,
      );
      emit(LoadedQuestionsState(
        subjectId: event.subjectId,
        questions: questions,
      ));
    } catch (_) {
      emit(const ErrorQuestionsState());
    }
  }

  void _filter(FilterQuestionsEvent event, Emitter<QuestionsState> emit) async {
    try {
      emit(const LoadingQuestionsState());

      final questions = await sl<FindQuestionsByFilterUseCase>()(
        subjectId: event.subjectId,
        filter: event.filter,
      );

      emit(LoadedQuestionsState(
        subjectId: event.subjectId,
        questions: questions,
      ));
    } catch (_) {
      emit(const ErrorQuestionsState());
    }
  }
}

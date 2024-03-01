import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_answers_app/features/answer/app/bloc/answer_event.dart';
import 'package:interview_answers_app/features/answer/app/bloc/answer_state.dart';
import 'package:interview_answers_app/features/answer/domain/use_cases/get_question_use_case.dart';
import 'package:interview_answers_app/main.dart';

class AnswerBloc extends Bloc<AnswerEvent, AnswerState> {
  AnswerBloc() : super(const InitAnswerState()) {
    on<LoadAnswerEvent>(_load);
  }

  void _load(LoadAnswerEvent event, Emitter<AnswerState> emit) async {
    try {
      emit(const LoadingAnswerState());
      final question = await sl<GetQuestionUseCase>()(
        subjectId: event.subjectId,
        questionId: event.questionId,
      );
      emit(LoadedAnswerState(question: question));
    } catch (_) {
      emit(const ErrorAnswerState());
    }
  }
}

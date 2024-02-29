sealed class AnswerEvent {
  const AnswerEvent();
}

class LoadAnswerEvent extends AnswerEvent {
  final int subjectId;
  final int questionId;

  const LoadAnswerEvent({
    required this.subjectId,
    required this.questionId,
  });
}

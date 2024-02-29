sealed class QuestionsEvent {
  const QuestionsEvent();
}

class LoadQuestionsEvent extends QuestionsEvent {
  final int subjectId;
  final int questionId;

  const LoadQuestionsEvent({
    required this.subjectId,
    required this.questionId,
  });
}

sealed class QuestionsEvent {
  const QuestionsEvent();
}

class LoadQuestionsEvent extends QuestionsEvent {
  final int subjectId;

  const LoadQuestionsEvent({
    required this.subjectId,
  });
}

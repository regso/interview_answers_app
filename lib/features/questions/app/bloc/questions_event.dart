sealed class QuestionsEvent {
  const QuestionsEvent();
}

class LoadQuestionsEvent extends QuestionsEvent {
  final int subjectId;

  const LoadQuestionsEvent({
    required this.subjectId,
  });
}

class FilterQuestionsEvent extends QuestionsEvent {
  final int subjectId;
  final String filter;

  const FilterQuestionsEvent({
    required this.subjectId,
    required this.filter,
  });
}

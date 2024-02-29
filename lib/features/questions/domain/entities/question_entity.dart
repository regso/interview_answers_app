class QuestionEntity {
  final int id;
  final String title;
  final String question;
  final String answer;
  final int difficulty;

  const QuestionEntity({
    required this.id,
    required this.title,
    required this.question,
    required this.answer,
    required this.difficulty,
  });
}

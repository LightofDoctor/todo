abstract class CreateQuestionEvent{}



class CreateQuestionsEvent extends CreateQuestionEvent{
  final String question;
  final List<String> answers;

  CreateQuestionsEvent(this.question,this.answers);
}
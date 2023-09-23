abstract class CreateQuestionEvent{}



class CreateQuestionsEvent extends CreateQuestionEvent{
  final String question;
  CreateQuestionsEvent(this.question);
}
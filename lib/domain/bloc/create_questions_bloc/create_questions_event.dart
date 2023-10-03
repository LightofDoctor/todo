import '../../../data/models/answer_model.dart';
import '../../../data/models/questions_model.dart';

abstract class CreateQuestionEvent{}



class WriteToFirebaseEvent extends CreateQuestionEvent{
  final Question question;
  WriteToFirebaseEvent(this.question);
}
class AddAnswerEvent extends CreateQuestionEvent{

  final List<String> answers;
  AddAnswerEvent(this.answers);
}
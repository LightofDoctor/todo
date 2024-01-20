
import '../../../data/models/questions_model.dart';

abstract class CreateQuestionsState{}




class LoadedQuestionState extends CreateQuestionsState{

}

class ErrorQuestionState extends CreateQuestionsState{

}
 class LoadQuestionState extends CreateQuestionsState{
   final String question;
   final List<String> answers;
   LoadQuestionState(this.question, this.answers);

 }